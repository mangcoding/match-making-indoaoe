<template>
    <div @click="onPlayerSelected" class="flex p-1 border border-gray-200 rounded pointer"
        :class="{ 'glow-border': inMatch }">
        <div class="flex items-center pr-1 text-xs "><img class="w-16 rounded-md" :src="avatar || 'profile.png'" :alt="player.name"></div>
        <div class="w-full ">
            <p class="text-sm font-semibold text-left">{{ rank+1 }}. {{ player.name }}</p>
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
        this.fetchProfile()
    },
    methods: {
        onPlayerSelected() {
            this.$emit('player-selected', this.player)
        },
        fetchProfile() {
            const cachedProfile = localStorage.getItem(this.player.aoe2net_id);
            if (cachedProfile) {
                this.avatar = cachedProfile;
                return;
            }
            if (this.player.aoe2net_id === null) {
                return;
            }
            fetch('https://api.ageofempires.com/api/v2/AgeII/GetMPFull', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                    // 'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: JSON.stringify({
                    profileId: this.player.aoe2net_id
                })
            })
                .then(response => response.json())
                .then(json => {
                    if (json.user && json.user.hasOwnProperty("avatarUrl")) {
                        localStorage.setItem(this.player.aoe2net_id, json.user.avatarUrl);
                        this.avatar = json.user.avatarUrl;
                    }
                });
            
        }
    }
};
</script>