package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strings"
	"sync"
	"time"

	_ "github.com/lib/pq"
)

type Player struct {
	ID        int    `json:"id"`
	Aoe2netID int    `json:"aoe2net_id"`
	Name      string `json:"name"`
}

type GameMatch struct {
	MatchID    string `json:"match_id"`
	StartedAt  string `json:"started_at"`
	FinishedAt string `json:"finished_at"`
	Name       string `json:"name"`
	Map        string `json:"map"`
	Server     string `json:"server"`
}

type MatchTeam struct {
	MatchID   string `json:"match_id"`
	Aoe2netID int    `json:"aoe2net_id"`
	TeamID    int    `json:"team_id"`
	Won       bool   `json:"won"`
	Civ       int    `json:"civ"`
}

type ApiService struct{}

func (api *ApiService) GetMatches(playerID, page int) ([]map[string]interface{}, error) {
	url := fmt.Sprintf("https://data.aoe2companion.com/api/matches?profile_ids=%d&page=%d&language=en", playerID, page)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	var result map[string]interface{}
	if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
		return nil, err
	}

	matches := result["matches"].([]interface{})
	filteredMatches := []map[string]interface{}{}
	for _, match := range matches {
		matchMap := match.(map[string]interface{})
		if matchName, ok := matchMap["name"].(string); ok && containsIndo(matchName) {
			filteredMatches = append(filteredMatches, matchMap)
		}
	}
	return filteredMatches, nil
}

func containsIndo(name string) bool {
	lower := strings.ToLower(name)

	return strings.Contains(lower, "indo")
}

func fetchMatchesForPage(player Player, page int, apiService *ApiService, wg *sync.WaitGroup, matchesChan chan []map[string]interface{}) {
	defer wg.Done()
	matches, err := apiService.GetMatches(player.Aoe2netID, page)
	if err != nil {
		log.Printf("Error fetching matches for player %s on page %d: %v", player.Name, page, err)
		return
	}
	if len(matches) > 0 {
		fmt.Printf("Fetched %d matches for player %s on page %d\n", len(matches), player.Name, page)
		matchesChan <- matches
	}
}

func syncMatch(db *sql.DB, apiService *ApiService) []map[string]interface{} {
	rows, err := db.Query("SELECT id, aoe2net_id, name FROM players WHERE status = '1' AND aoe2net_id IS NOT NULL")
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	var players []Player
	for rows.Next() {
		var player Player
		if err := rows.Scan(&player.ID, &player.Aoe2netID, &player.Name); err != nil {
			log.Fatal(err)
		}
		players = append(players, player)
	}

	var wg sync.WaitGroup
	matchesChan := make(chan []map[string]interface{}, len(players)*10) // Assuming a maximum of 10 pages per player
	concurrencyLimit := 10
	semaphore := make(chan struct{}, concurrencyLimit)

	for _, player := range players {
		page := 1
		for {
			semaphore <- struct{}{}
			wg.Add(1)
			go func(player Player, page int) {
				defer func() { <-semaphore }()
				fetchMatchesForPage(player, page, apiService, &wg, matchesChan)
			}(player, page)
			page++
			if page > 10 { // Assuming a maximum of 10 pages per player to avoid infinite loops
				break
			}
		}
	}

	wg.Wait()
	close(matchesChan)

	var allMatches []map[string]interface{}
	for matches := range matchesChan {
		allMatches = append(allMatches, matches...)
	}

	// remove duplicates data by match_id
	matchMap := make(map[string]map[string]interface{})
	for _, match := range allMatches {
		matchID := match["matchId"].(float64)
		matchMap[fmt.Sprintf("%f", matchID)] = match
	}

	allMatches = []map[string]interface{}{}
	for _, match := range matchMap {
		allMatches = append(allMatches, match)
	}
	return allMatches
}

func saveMatches(db *sql.DB, matches []map[string]interface{}) {
	for _, match := range matches {
		matchID := match["matchId"].(float64)
		var exists bool
		err := db.QueryRow("SELECT EXISTS(SELECT 1 FROM game_matches WHERE match_id = $1)", matchID).Scan(&exists)
		if err != nil {
			log.Fatal(err)
		}
		if exists {
			continue
		}

		stmt, err := db.Prepare("INSERT INTO game_matches (match_id, started_at, finished_at, name, map, server) VALUES ($1, $2, $3, $4, $5, $6)")
		if err != nil {
			log.Fatal(err)
		}
		defer stmt.Close()

		_, err = stmt.Exec(matchID, match["started"], match["finished"], match["name"], match["map"], match["server"])
		if err != nil {
			log.Fatal(err)
		}

		teams := match["teams"].([]interface{})
		for _, team := range teams {
			players := team.(map[string]interface{})["players"].([]interface{})
			for _, player := range players {
				playerMap := player.(map[string]interface{})
				won := playerMap["won"]
				if won == nil {
					won = false
				}
				// skip if team is null
				if playerMap["team"] == nil {
					continue
				}
				_, err := db.Exec("INSERT INTO match_teams (match_id, aoe2net_id, team_id, won, civ) VALUES ($1, $2, $3, $4, $5) ON CONFLICT DO NOTHING",
					matchID, playerMap["profileId"], playerMap["team"], won, playerMap["civ"])
				if err != nil {
					log.Fatal(err)
				}
			}
		}
	}
}

func main() {
	connStr := "user=postgres password=Mugen1996@@ dbname=aoe host=192.168.88.6 sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	apiService := &ApiService{}
	start := time.Now()
	allMatches := syncMatch(db, apiService)
	saveMatches(db, allMatches)
	duration := time.Since(start)
	fmt.Printf("Fetched all matches in %s\n and total match is %d", duration, len(allMatches))
}
