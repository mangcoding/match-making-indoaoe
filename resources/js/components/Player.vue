<template>
  <div
    @click="onPlayerSelected"
    class="flex p-1 border border-gray-200 rounded pointer"
    :class="{ 'glow-border': inMatch }"
  >
    <div class="flex items-center pr-1 text-xs">
      <img
        class="w-16 rounded-md"
        :src="player.avatar_url || 'profile.png'"
        :alt="player.name"
      />
    </div>
    <div class="w-full">
      <p class="text-sm font-semibold text-left">
        {{ player.rank }}. {{ skullName(player.name, player.streak) }}
      </p>
      <p class="text-xs text-left">{{ player.alias }}</p>
      <p class="text-left">
        {{ player.oriElo }}
        <sup
          v-bind:class="{
            'text-green-500': player.streak > 0,
            'text-red-500': player.streak < 0,
          }"
          >{{ player.streak }}</sup
        >
        <small style="color: green; font-size: 10px"> ({{ player.elo }})</small>
      </p>
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
  mounted() {},
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