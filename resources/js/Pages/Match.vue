<template>
    <div class="mb-5">
        <div class="header-bg row align-items-center text-center text-gold">
            <div>
                <h1 class="text-sm">Age Of Empires Indonesia</h1>
                <p class="text-sm">Match Making</p>
            </div>
        </div>

        <div class="container">
            <div class="row mt-5">
                <div class="col-sm-4">

                </div>
            </div>
            <div v-if="selectedPlayers.length > 0">
                <div class="row">
                    <div class="col-sm-4" v-for="(p, k) in selectedPlayers" :key="k">
                        <player :player="p" :key="p.aoe2net_id"></player>
                    </div>
                </div>
            </div>
            <form v-if="teams.a.length == 0" @submit.prevent="findPlayer">
                <div class="d-flex justify-content-between mb-2">
                    <label class="text-gold d-block">Select Player</label>
                    <!-- <select v-model="country" class="d-block">
                        <option value="ID">Indonesia</option>
                        <option value="SG">Singapore</option>
                        <option value="">Semua</option>
                    </select> -->
                </div>
                <div>
                    <div class="input-group mb-3">
                        <input v-model="filter" type="text" class="form-control" placeholder="Type player name here"
                            aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <!-- <div class="input-group-append">
                            <button @click="findPlayer" class="btn btn-warning" type="button">Find</button>
                        </div> -->
                    </div>
                </div>
                <div class="players">
                    <div class="row">
                        <div class="col-sm-6" v-for="(p, k) in filteredEntries" :key="k">
                            <player :player="p" @player-selected="selectedPlayer" :key="p.aoe2net_id"></player>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary mt-2" @click.prevent="buildTeamButtonPressed">
                    Build Team
                </button>
            </form>

            <div class="row mt-3 text-gold" v-if="teams.a.length > 0">
                <a href="#" @click.prevent="resetTeam">Reset</a>
                <div class="col-sm-6">
                    <h3>Team A</h3>
                    <div v-for="(p, k) in teams.a" :key="k">
                        <player :player="p" :key="p.aoe2net_id" :inMatch="true"></player>
                    </div>
                    <p>Total Elo {{ countElo(teams.a) }}</p>
                </div>

                <div class="col-sm-6">
                    <h3>Team B</h3>
                    <div v-for="(p, k) in teams.b" :key="k">
                        <player :player="p" :key="p.aoe2net_id" :inMatch="true"></player>
                    </div>

                    <p>Total Elo {{ countElo(teams.b) }}</p>
                </div>

                <div class="col-sm-12">
                    <button class="btn btn-primary mt-2" @click="copyMatch">Copy to Text</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Player from '../components/Player.vue';

function dynamicSort(property) {
    var sortOrder = 1;
    if (property[0] === "-") {
        sortOrder = -1;
        property = property.substr(1);
    }
    return function (a, b) {
        /* next line works with strings and numbers,
         * and you may want to customize it to your needs
         */
        var result =
            a[property] < b[property] ? -1 : a[property] > b[property] ? 1 : 0;
        return result * sortOrder;
    };
}

export default {
    components: { Player },
    props: ['players'],
    data() {
        return {
            selectedPlayers: [],
            filter: "",
            teams: {
                a: [],
                b: [],
            },
            country: 'ID',
            audio: null
        };
    },
    mounted() {
        // Fetch all players
        // this.findPlayer();
        this.audio = new Audio("/ready.ogg");
    },
    computed: {
        filteredEntries() {
            return this.players.filter((el) => { return el.name.toLowerCase().includes(this.filter.toLowerCase()) });
        }
    },
    methods: {
        copyMatch() {
            let text = "";
            this.teams.a.forEach((p) => {
                text += p.name + ", ";
            });
            text += "vs ";
            this.teams.b.forEach((p) => {
                text += p.name + ", ";
            });
            console.log(text);
            navigator.clipboard.writeText(text);
            // this.audio.play();
        },
        selectedPlayer(player) {
            this.selectedPlayers.push(player);
        },
        findPlayer() {
            // fetch(`https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=50&country=${this.country}&search=${this.filter}`)
            //     .then((response) => response.json())
            //     .then((data) => this.players = data.leaderboard);
        },
        resetTeam() {
            // Clear Teams
            this.selectedPlayers = [];
            this.teams.a = [];
            this.teams.b = [];
        },
        buildTeamButtonPressed() {
            // Clear Teams
            this.teams.a = [];
            this.teams.b = [];

            // Randomize
            this.selectedPlayers = this.selectedPlayers.sort(() => Math.random() - 0.5);

            // Sort By Elo
            this.selectedPlayers = this.selectedPlayers.sort(dynamicSort("-elo"));

            this.selectedPlayers.forEach(async (item) => {
                let sum = 0;
                let sumB = 0;
                for (var i = 0; i < this.teams.a.length; i++) {
                    sum += this.teams.a[i].elo;
                }

                for (var j = 0; j < this.teams.b.length; j++) {
                    sumB += this.teams.b[j].elo;
                }
                if (sum > sumB) {
                    this.teams.b.push(item);
                } else {
                    this.teams.a.push(item);
                }
            });
            // Play sound

            this.audio.play();
        },

        countElo(team) {
            let sum = 0;
            for (var i = 0; i < team.length; i++) {
                sum += team[i].elo;
            }

            return sum;
        },
    },
};
</script>