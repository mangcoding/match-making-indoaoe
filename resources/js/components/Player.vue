<template>
  <div @click="onPlayerSelected" class="flex flex-col p-1 border border-gray-200 rounded pointer"
    :class="{ 'glow-border': inMatch }">
    <div class="flex">
      <div class="flex items-center pr-1 text-xs relative">
        <img v-show="player.streak >= 5"  class="absolute -rotate-45 -top-6 -left-5" width="50" src="https://i.giphy.com/fRaFhz7PtRH5vdfCGL.webp"/>
        <img v-show="player.streak <= -5"  class="absolute -top-6 -left-5" width="50" src="https://i.giphy.com/iD7KUaMRuug5vS4Mn6.webp"/>
        <img class="w-16 rounded-md" :src="player.avatar_url || 'profile.png'" :alt="player.name" />
      </div>
      <div class="w-full">
        <p class="text-sm font-semibold text-left">
          {{ player.rank }}. {{ skullName(player.name, player.streak) }}
        </p>
        <p class="text-xs text-left">{{ player.alias }}</p>
        <p class="text-left">
          {{ player.final_elo }}
          <sup v-bind:class="{
            'text-green-500': player.streak > 0,
            'text-red-500': player.streak < 0,
          }">{{ player.streak }}</sup>
          <small style="color: green; font-size: 10px"> ({{ player.elo }})</small>
        </p>
      </div>
    </div>
    <div class="flex justify-between text-sm border mt-2 p-2">
      <p class="text-green-500">Win : {{player.win}}</p>
      <p class="text-red-500">Lose : {{player.lose}}</p>
    </div>
  </div>
</template>
<style scoped>
.name {
  font-size: 1.2rem;
}

.pointer {
  cursor: pointer;
}
</style>
<script>
// Minimum lose streak to show skull icon
const MIN_STREAK = -3;

export default {
  name: "Player",
  props: {
    player: {
      type: Object,
    },
    inMatch: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      selected: false,
      avatar: null,
    };
  },
  mounted() { },
  methods: {
    onPlayerSelected() {
      this.$emit("player-selected", this.player);
    },
    skullName: function (name, streak) {
      if (streak <= MIN_STREAK) {
        return name + " 💀";
      }

      return name;
    },
  },
  filters: {},
};
</script>