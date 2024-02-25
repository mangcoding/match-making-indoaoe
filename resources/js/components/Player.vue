<template>
    <div @click="onPlayerSelected" class="flex p-1 border border-gray-200 rounded pointer"
        :class="{ 'glow-border': inMatch }">
        <div class="flex items-center pr-1 text-xs "><img class="w-16 rounded-md" :src="player.avatar_url || 'profile.png'" :alt="player.name"></div>
        <div class="w-full ">
            <p class="text-sm font-semibold text-left">{{ rank+1 }}. {{ player.name }}</p>
            <p class="text-xs text-left">{{ player.alias }}</p>
            <p class="text-left"><span class="text-base font-semibold text-[#F2AC4B]">{{ player.newElo }}</span> ({{ player.oriElo }}) <small style="color:green; font-size:10px">-- {{ player.elo }}</small></p>
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


export default {
    name: "Player",
    props: {
        rank: {
            type: Number,
            default: 0
        },
        player: {
            type: Object
        },
        inMatch: {
            type: Boolean,
            default: false
        },
    },
    data() {
        return {
            selected: false,
            avatar: null,
        };
    },
    mounted() {
    },
    methods: {
        onPlayerSelected() {
            this.$emit('player-selected', this.player)
        },
    }
};
</script>