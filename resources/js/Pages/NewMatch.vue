<template>
  <header
    class="relative min-h-screen bg-fixed bg-center bg-no-repeat bg-cover"
  >
    <Modal />
    <!-- Overlay Background + Center Control -->
    <div class="flex flex-col items-center min-h-screen bg-black bg-opacity-50">
      <h1 class="text-lg font-bold text-white p-7">
        Age Of Empires Indonesia - Match Making
      </h1>
      <form
        class="max-w-xl p-5 text-center bg-white border border-gray-200 rounded-lg shadow lg:w-full"
        v-if="!selectedTeams"
        @submit.prevent="findPlayer"
      >
        <div class="flex flex-col items-center">
          <h2 class="font-semibold">Select Player</h2>
          <small class="self-start mt-5 text-gray-400"
            >Last data updated : {{ lastUpdate | formatDate }}</small
          >
          <div
            class="mb-5 w-full p-6 text-center bg-white border border-gray-200 rounded-lg shadow"
          >
            <label for="simple-search " class="sr-only">Search</label>
            <div class="relative w-full">
              <input
                v-model="filter"
                type="text"
                id="simple-search"
                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                placeholder="Search Player"
                required
              />
              <div
                class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none"
              >
                <svg
                  width="18"
                  height="18"
                  viewBox="0 0 18 18"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M17 17L13.2223 13.2156L17 17ZM15.3158 8.15789C15.3158 10.0563 14.5617 11.8769 13.2193 13.2193C11.8769 14.5617 10.0563 15.3158 8.15789 15.3158C6.2595 15.3158 4.43886 14.5617 3.0965 13.2193C1.75413 11.8769 1 10.0563 1 8.15789C1 6.2595 1.75413 4.43886 3.0965 3.0965C4.43886 1.75413 6.2595 1 8.15789 1C10.0563 1 11.8769 1.75413 13.2193 3.0965C14.5617 4.43886 15.3158 6.2595 15.3158 8.15789V8.15789Z"
                    stroke="#9DA3AD"
                    stroke-width="2"
                    stroke-linecap="round"
                  />
                </svg>
              </div>
            </div>
            <div class="pt-2 players">
              <div
                class="grid grid-cols-1 md:grid-cols-2 gap-2 max-h-[calc(100vh-550px)] overflow-y-auto p-5"
              >
                <div class="" v-for="(p, k) in filteredEntries" :key="k">
                  <player
                    :player="p"
                    @player-selected="selectedPlayer"
                    :key="p.aoe2net_id"
                  ></player>
                </div>
              </div>
            </div>
          </div>
          <div
            v-if="selectedPlayers.length > 0"
            class="w-full p-6 bg-gradient-to-r from-gray-300 to-[#8997B0] border border-gray-200 text-center rounded-lg shadow"
          >
            <h2 class="pb-5 font-semibold">Selected Player</h2>
            <div class="grid h-full grid-cols-1 gap-2 md:grid-cols-2">
              <div class="relative" v-for="(p, k) in selectedPlayers" :key="k">
                <player
                  class="bg-white"
                  :player="p"
                  :key="p.aoe2net_id"
                ></player>
                <button
                  class="absolute -translate-y-1/2 right-4 top-1/2"
                  @click="cancelSelection(k)"
                >
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 12 12"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M11.7465 10.5349C11.9074 10.6958 11.9979 10.9141 11.9979 11.1417C11.9979 11.3694 11.9074 11.5877 11.7465 11.7486C11.5855 11.9096 11.3672 12 11.1396 12C10.912 12 10.6937 11.9096 10.5327 11.7486L5.99964 7.21412L1.46515 11.7472C1.30419 11.9081 1.08589 11.9986 0.858264 11.9986C0.630638 11.9986 0.412335 11.9081 0.25138 11.7472C0.0904241 11.5862 2.39843e-09 11.3679 0 11.1403C-2.39843e-09 10.9127 0.0904241 10.6944 0.25138 10.5334L4.78587 6.00036L0.252807 1.46586C0.0918518 1.30491 0.00142799 1.0866 0.001428 0.858978C0.001428 0.631352 0.0918518 0.413049 0.252807 0.252094C0.413763 0.0911379 0.632066 0.000713864 0.859692 0.000713861C1.08732 0.000713859 1.30562 0.0911379 1.46658 0.252094L5.99964 4.78659L10.5341 0.251379C10.6951 0.0904238 10.9134 -3.79225e-09 11.141 0C11.3686 3.79225e-09 11.5869 0.0904238 11.7479 0.251379C11.9089 0.412335 11.9993 0.630638 11.9993 0.858263C11.9993 1.08589 11.9089 1.30419 11.7479 1.46515L7.21341 6.00036L11.7465 10.5349Z"
                      fill="#F24E1E"
                    />
                  </svg>
                </button>
              </div>
            </div>
          </div>
          <div class="w-full">
            <button
              type="button"
              @click.prevent="buildTeamButtonPressed"
              class="inline-flex items-center justify-center w-full py-4 text-sm font-medium text-center text-white bg-[#4FAF2F] rounded-lg hover:bg-green-500 focus:ring-4 focus:outline-none focus:ring-green-200"
            >
              <span class="font-bold">GENERATE TEAM</span>
            </button>
          </div>
        </div>
      </form>
      <div
        class="p-5 text-center bg-white rounded-lg"
        v-if="selectedTeams && selectedTeams[teamIndex].team_a.length > 0"
      >
        <div class="flex justify-between">
          <h1 class="pb-4 text-lg font-bold">
            Team Results ({{ teamIndex + 1 }})
          </h1>
          <span>Total Team Generated: {{ selectedTeams.length }}</span>
        </div>
        <div class="grid grid-cols-1 gap-2 md:grid-cols-2">
          <div
            class="bg-gradient-to-r from-red-300 to-[#F67878] rounded-lg shadow p-4 text-center"
          >
            <h3 class="mb-2 text-lg font-semibold">Team 1</h3>
            <div
              class="pb-2"
              v-for="(p, k) in selectedTeams[teamIndex].team_a"
              :key="k"
            >
              <player
                class="bg-white"
                :player="p"
                :key="p.aoe2net_id"
                :inMatch="true"
              ></player>
            </div>
            <p class="pt-4 font-bold">
              Total Elo :
              {{ parseFloat(selectedTeams[teamIndex].elo_a).toFixed(1) }}
            </p>
          </div>
          <div
            class="bg-gradient-to-r from-blue-300 to-[#79A2F3] rounded-lg shadow p-4 text-center"
          >
            <h3 class="mb-2 text-lg font-semibold">Team 2</h3>
            <div
              class="pb-2"
              v-for="(p, k) in selectedTeams[teamIndex].team_b"
              :key="k"
            >
              <player
                class="bg-white"
                :player="p"
                :key="p.aoe2net_id"
                :inMatch="true"
              ></player>
            </div>
            <p class="pt-4 font-bold">
              Total Elo :
              {{ parseFloat(selectedTeams[teamIndex].elo_b).toFixed(1) }}
            </p>
          </div>
        </div>
        <div class="flex items-end pt-5 justify-between">
          <span class="font-semibold">Total Selisih Elo</span>
          <span class="font-bold text-lg"
            >{{ selectedTeams[teamIndex].diff.toFixed(1) }} poin</span
          >
        </div>
        <div class="flex items-center gap-2 pt-5">
          <button
            @click.prevent="regeneratePressed"
            class="inline-flex gap-1 items-center justify-center px-5 py-3 text-sm font-medium text-center text-white bg-[#4FAF2F] rounded-lg hover:bg-green-500 focus:ring-4 focus:outline-none focus:ring-green-200"
          >
            <svg
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                opacity="0.2"
                d="M20.25 4.5V9H15.75L20.25 4.5ZM3.75 19.5L8.25 15H3.75V19.5Z"
                fill="white"
              />
              <path
                d="M20.5369 3.80719C20.3998 3.75034 20.249 3.7354 20.1035 3.76427C19.958 3.79314 19.8243 3.86452 19.7194 3.96938L18.2137 5.47594C16.3247 3.85313 14.19 3 12 3C7.98563 3 5.57063 5.36906 5.46938 5.46938C5.32864 5.61011 5.24958 5.80098 5.24958 6C5.24958 6.19902 5.32864 6.38989 5.46938 6.53063C5.61011 6.67136 5.80098 6.75042 6 6.75042C6.19902 6.75042 6.3899 6.67136 6.53063 6.53063C6.55031 6.51 8.59969 4.5 12 4.5C14.1722 4.5 15.93 5.51719 17.1487 6.54L15.2194 8.46937C15.1144 8.57427 15.0428 8.70796 15.0139 8.85352C14.9849 8.99908 14.9997 9.14998 15.0565 9.28709C15.1133 9.42421 15.2096 9.54139 15.333 9.62379C15.4565 9.70619 15.6016 9.75012 15.75 9.75H20.25C20.4489 9.75 20.6397 9.67098 20.7803 9.53033C20.921 9.38968 21 9.19891 21 9V4.5C21 4.35166 20.956 4.20667 20.8735 4.08335C20.7911 3.96003 20.6739 3.86393 20.5369 3.80719ZM19.5 8.25H17.5603L19.5 6.31031V8.25ZM17.4694 17.4694C17.4497 17.49 15.4003 19.5 12 19.5C9.82781 19.5 8.07 18.4828 6.85125 17.46L8.78063 15.5306C8.88563 15.4257 8.95716 15.292 8.98615 15.1465C9.01514 15.0009 9.00028 14.85 8.94347 14.7129C8.88665 14.5758 8.79043 14.4586 8.66699 14.3762C8.54354 14.2938 8.39842 14.2499 8.25 14.25H3.75C3.55109 14.25 3.36032 14.329 3.21967 14.4697C3.07902 14.6103 3 14.8011 3 15V19.5C2.99988 19.6484 3.04381 19.7935 3.12621 19.917C3.20861 20.0404 3.32579 20.1367 3.46291 20.1935C3.60002 20.2503 3.75092 20.2651 3.89648 20.2361C4.04204 20.2072 4.17573 20.1356 4.28063 20.0306L5.78625 18.5241C7.67531 20.1469 9.81 21 12 21C16.0144 21 18.4294 18.6309 18.5306 18.5306C18.6714 18.3899 18.7504 18.199 18.7504 18C18.7504 17.801 18.6714 17.6101 18.5306 17.4694C18.3899 17.3286 18.199 17.2496 18 17.2496C17.801 17.2496 17.6101 17.3286 17.4694 17.4694ZM4.5 15.75H6.43969L4.5 17.6897V15.75Z"
                fill="white"
              />
            </svg>
            <span class="font-bold">REGENERATE TEAM</span>
          </button>
          <button
            @click="copyMatch"
            class="inline-flex gap-1 items-center justify-center px-5 py-3 text-sm font-medium text-center text-white bg-[#F2AC4B] rounded-lg hover:bg-yellow-500 focus:ring-4 focus:outline-none focus:ring-yellow-200"
          >
            <svg
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                opacity="0.2"
                d="M17.25 6.75V20.25H3.75V6.75H17.25Z"
                fill="white"
              />
              <path
                d="M17.25 6H3.75C3.55109 6 3.36032 6.07902 3.21967 6.21967C3.07902 6.36032 3 6.55109 3 6.75V20.25C3 20.4489 3.07902 20.6397 3.21967 20.7803C3.36032 20.921 3.55109 21 3.75 21H17.25C17.4489 21 17.6397 20.921 17.7803 20.7803C17.921 20.6397 18 20.4489 18 20.25V6.75C18 6.55109 17.921 6.36032 17.7803 6.21967C17.6397 6.07902 17.4489 6 17.25 6ZM16.5 19.5H4.5V7.5H16.5V19.5ZM21 3.75V17.25C21 17.4489 20.921 17.6397 20.7803 17.7803C20.6397 17.921 20.4489 18 20.25 18C20.0511 18 19.8603 17.921 19.7197 17.7803C19.579 17.6397 19.5 17.4489 19.5 17.25V4.5H6.75C6.55109 4.5 6.36032 4.42098 6.21967 4.28033C6.07902 4.13968 6 3.94891 6 3.75C6 3.55109 6.07902 3.36032 6.21967 3.21967C6.36032 3.07902 6.55109 3 6.75 3H20.25C20.4489 3 20.6397 3.07902 20.7803 3.21967C20.921 3.36032 21 3.55109 21 3.75Z"
                fill="white"
              />
            </svg>
            <span class="font-bold">COPY TO TEXT</span>
          </button>
          <button
            @click.prevent="resetTeam"
            class="inline-flex items-center justify-center gap-1 px-5 py-3 text-sm font-medium text-center text-white bg-[#BB3434] rounded-lg hover:bg-red-500 focus:ring-4 focus:outline-none focus:ring-red-200"
          >
            <svg
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                opacity="0.2"
                d="M21 12C21 13.78 20.4722 15.5201 19.4832 17.0001C18.4943 18.4802 17.0887 19.6337 15.4442 20.3149C13.7996 20.9961 11.99 21.1743 10.2442 20.8271C8.49836 20.4798 6.89472 19.6226 5.63604 18.364C4.37737 17.1053 3.5202 15.5016 3.17294 13.7558C2.82567 12.01 3.0039 10.2004 3.68509 8.55585C4.36628 6.91131 5.51983 5.50571 6.99987 4.51677C8.47991 3.52784 10.22 3 12 3C14.387 3 16.6761 3.94821 18.364 5.63604C20.0518 7.32387 21 9.61305 21 12Z"
                fill="white"
              />
              <path
                d="M15.5306 9.53063L13.0603 12L15.5306 14.4694C15.6003 14.5391 15.6556 14.6218 15.6933 14.7128C15.731 14.8039 15.7504 14.9015 15.7504 15C15.7504 15.0985 15.731 15.1961 15.6933 15.2872C15.6556 15.3782 15.6003 15.4609 15.5306 15.5306C15.4609 15.6003 15.3782 15.6556 15.2872 15.6933C15.1961 15.731 15.0986 15.7504 15 15.7504C14.9015 15.7504 14.8039 15.731 14.7128 15.6933C14.6218 15.6556 14.5391 15.6003 14.4694 15.5306L12 13.0603L9.53063 15.5306C9.46095 15.6003 9.37822 15.6556 9.28718 15.6933C9.19613 15.731 9.09855 15.7504 9 15.7504C8.90146 15.7504 8.80388 15.731 8.71283 15.6933C8.62179 15.6556 8.53906 15.6003 8.46938 15.5306C8.3997 15.4609 8.34442 15.3782 8.30671 15.2872C8.269 15.1961 8.24959 15.0985 8.24959 15C8.24959 14.9015 8.269 14.8039 8.30671 14.7128C8.34442 14.6218 8.3997 14.5391 8.46938 14.4694L10.9397 12L8.46938 9.53063C8.32865 9.38989 8.24959 9.19902 8.24959 9C8.24959 8.80098 8.32865 8.61011 8.46938 8.46937C8.61011 8.32864 8.80098 8.24958 9 8.24958C9.19903 8.24958 9.3899 8.32864 9.53063 8.46937L12 10.9397L14.4694 8.46937C14.5391 8.39969 14.6218 8.34442 14.7128 8.3067C14.8039 8.26899 14.9015 8.24958 15 8.24958C15.0986 8.24958 15.1961 8.26899 15.2872 8.3067C15.3782 8.34442 15.4609 8.39969 15.5306 8.46937C15.6003 8.53906 15.6556 8.62178 15.6933 8.71283C15.731 8.80387 15.7504 8.90145 15.7504 9C15.7504 9.09855 15.731 9.19613 15.6933 9.28717C15.6556 9.37822 15.6003 9.46094 15.5306 9.53063ZM21.75 12C21.75 13.9284 21.1782 15.8134 20.1068 17.4168C19.0355 19.0202 17.5127 20.2699 15.7312 21.0078C13.9496 21.7458 11.9892 21.9389 10.0979 21.5627C8.20656 21.1865 6.46928 20.2579 5.10571 18.8943C3.74215 17.5307 2.81355 15.7934 2.43735 13.9021C2.06114 12.0108 2.25422 10.0504 2.99218 8.26884C3.73013 6.48726 4.97982 4.96452 6.58319 3.89317C8.18657 2.82183 10.0716 2.25 12 2.25C14.585 2.25273 17.0634 3.28084 18.8913 5.10872C20.7192 6.93661 21.7473 9.41498 21.75 12ZM20.25 12C20.25 10.3683 19.7662 8.77325 18.8596 7.41655C17.9531 6.05984 16.6646 5.00242 15.1571 4.37799C13.6497 3.75357 11.9909 3.59019 10.3905 3.90852C8.79017 4.22685 7.32016 5.01259 6.16637 6.16637C5.01259 7.32015 4.22685 8.79016 3.90853 10.3905C3.5902 11.9908 3.75358 13.6496 4.378 15.1571C5.00242 16.6646 6.05984 17.9531 7.41655 18.8596C8.77326 19.7661 10.3683 20.25 12 20.25C14.1873 20.2475 16.2843 19.3775 17.8309 17.8309C19.3775 16.2843 20.2475 14.1873 20.25 12Z"
                fill="white"
              />
            </svg>
            <span class="font-bold">RESETS</span>
          </button>
        </div>
      </div>
      <!-- Supporter -->
      <a href="https://saweria.co/aoeid" target="_blank" class="mt-5 inline-flex gap-1 items-center justify-center px-5 py-3 text-sm font-medium text-center text-white bg-[#F2AC4B] rounded-lg hover:bg-yellow-500 focus:ring-4 focus:outline-none focus:ring-yellow-200">Click here for donation</a>
    </div>
  </header>
</template>
<script>
import Player from "../components/Player.vue";
import Modal from "../components/Modal.vue";
import moment from "moment";

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
  components: { Player, Modal },
  props: ["players", "lastUpdate"],
  data() {
    return {
      selectedPlayers: [],
      filter: "",
      teams: {
        a: [],
        b: [],
      },
      country: "ID",
      audio: null,
      selectedTeams: null,
      teamIndex: 0,
      matchTeam: [],
    };
  },
  mounted() {
    // Fetch all players
    // this.findPlayer();
    this.audio = new Audio("/ready.ogg");
  },
  computed: {
    filteredEntries() {
      return this.players.filter((el) => {
        return (el.name + el.alias)
          .toLowerCase()
          .includes(this.filter.toLowerCase());
      });
    },
  },
  filters: {
    formatDate: function (value) {
      return moment(value).fromNow();
    },
  },
  methods: {
    copyMatch() {
      let text = this.teamIndex + 1 + ").";
      text += this.selectedTeams[this.teamIndex].team_a
        .map((p) => {
          if (p.streak <= -3) {
            return p.name + "*";
          }
          return p.name;
        })
        .join(",");
      text += " vs ";
      text += this.selectedTeams[this.teamIndex].team_b
        .map((p) => {
          if (p.streak <= -3) {
            return p.name + "*";
          }
          return p.name;
        })
        .join(",");
      text +=
        " DIFF: " +
        this.selectedTeams[this.teamIndex].diff.toFixed(1) +
        " point";
      console.log(text);
      navigator.clipboard.writeText(text);
      // this.audio.play();
    },
    selectedPlayer(player) {
      if (this.selectedPlayers.indexOf(player) == -1)
        this.selectedPlayers.push(player);
    },
    cancelSelection(index) {
      this.selectedPlayers.splice(index, 1);
    },
    findPlayer() {
      // fetch(`https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=50&country=${this.country}&search=${this.filter}`)
      //     .then((response) => response.json())
      //     .then((data) => this.players = data.leaderboard);
    },
    resetTeam() {
      // Clear Teams
      this.selectedPlayers = [];
      this.selectedTeams = null;
    },
    regeneratePressed() {
      this.teamIndex =
        this.selectedTeams.length > this.teamIndex + 1 ? this.teamIndex + 1 : 0;
      // Play sound
      this.audio.play();
    },
    buildTeamButtonPressed() {
      function getCombinations(array, n) {
        const combinations = [];
        function backtrack(startIndex, currentCombination) {
          if (currentCombination.length === n) {
            combinations.push(currentCombination.slice());
            return;
          }
          for (let i = startIndex; i < array.length; i++) {
            currentCombination.push(array[i]);
            backtrack(i + 1, currentCombination);
            currentCombination.pop();
          }
        }
        backtrack(0, []);
        return combinations;
      }

      function compareByEloSum(balanceElo, a, b) {
        const aSum = Math.abs(
          a
            .map((player) => parseFloat(player.final_elo))
            .reduce((total, elo) => parseFloat(total) + parseFloat(elo)) -
            parseFloat(balanceElo)
        );
        const bSum = Math.abs(
          b
            .map((player) => parseFloat(player.final_elo))
            .reduce((total, elo) => parseFloat(total) + parseFloat(elo)) -
            parseFloat(balanceElo)
        );
        return aSum > bSum ? 1 : -1;
      }

      function filterByEloSum(array, targetSum) {
        let totalSum = array.map((team) =>
          team
            .map((player) => parseFloat(player.final_elo))
            .reduce((total, elo) => parseFloat(total) + parseFloat(elo))
        );
        let nearest = array.filter((team, index) => {
          return (
            totalSum[index] >= targetSum - 2 && totalSum[index] <= targetSum + 2
          );
        });

        if (nearest.length > 0) {
          return nearest;
        } else {
          return array.filter((team, index) => {
            return (
              totalSum[index] >= targetSum - 5 &&
              totalSum[index] <= targetSum + 5
            );
          });
        }
      }

      const combinationPlayers = getCombinations(
        this.selectedPlayers,
        Math.floor(this.selectedPlayers.length / 2)
      );
      const totalElo = this.selectedPlayers
        .map((player) => player.final_elo)
        .reduce((total, elo) => parseFloat(total) + parseFloat(elo));
      const balanceElo = Math.floor(totalElo / 2);
      combinationPlayers.sort((a, b) => compareByEloSum(balanceElo, a, b));
      const targetElo = combinationPlayers[0]
        .map((player) => player.final_elo)
        .reduce((total, elo) => parseFloat(total) + parseFloat(elo));
      let selectedTeams = filterByEloSum(combinationPlayers, targetElo);
      if (selectedTeams.length == 0) {
        alert("Selisih elo terlalu jauh, tidak bisa dibuat tim");
        return false;
      }
      if (selectedTeams.length > 10) {
        selectedTeams = selectedTeams.slice(0, 10);
      }
      /* group by sum oriElo */
      selectedTeams = selectedTeams.map((team) => {
        const elo_a = team
          .map((player) => player.final_elo)
          .reduce((total, elo) => parseFloat(total) + parseFloat(elo));
        const elo_b = this.selectedPlayers
          .filter((player) => !team.includes(player))
          .map((player) => player.final_elo)
          .reduce((total, elo) => parseFloat(total) + parseFloat(elo));
        return {
          team_a: team,
          team_b: this.selectedPlayers.filter(
            (player) => !team.includes(player)
          ),
          elo_a: elo_a,
          elo_b: elo_b,
          diff: Math.abs(elo_a - elo_b),
        };
      });
      this.selectedTeams = selectedTeams.sort((a, b) =>
        a.diff > b.diff ? 1 : -1
      );
      this.teamIndex = 0;
      // Play sound
      this.audio.play();
    },
  },
};
</script>
  