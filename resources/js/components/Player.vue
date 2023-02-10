<template>
    <div @click="onPlayerSelected" class="d-flex pointer card rounded mb-3 text-gold"
        :class="{ 'glow-border': (inMatch) }">
        <div class=""><img width="70" :src="avatar" :alt="player.name"></div>
        <div class="mx-2">
            <p class="m-0 name">{{ player.name }}</p>
            <p class="m-0 text-xs">Elo {{ player.elo }}</p>
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
    name: "HelloWorld",
    props: {
        player: {
            type: Object
        },
        inMatch: {
            type: Boolean,
            default: false
        }
    },
    data() {
        return {
            selected: false,
            avatar: null
        };
    },
    mounted() {
        this.fetchProfile()
    },
    computed: {
        profile() {
            if (this.player.rating >= 1400) {
                return "https://static.wikia.nocookie.net/ageofempires/images/2/28/Paladin_aoe2DE.png";
            }

            if (this.player.rating >= 1300) {
                return "https://static.wikia.nocookie.net/ageofempires/images/5/54/Champion_aoe2DE.png";
            }

            if (this.player.rating >= 1200) {
                return "https://static.wikia.nocookie.net/ageofempires/images/1/10/Cavalier_aoe2DE.png";
            }

            if (this.player.rating >= 1100) {
                return "https://static.wikia.nocookie.net/ageofempires/images/3/3c/Twohanded_aoe2DE.png";
            }

            if (this.player.rating >= 1000) {
                return "https://static.wikia.nocookie.net/ageofempires/images/a/aa/Halberdier_aoe2DE.png";
            }

            if (this.player.rating >= 900) {
                return "https://static.wikia.nocookie.net/ageofempires/images/a/a6/Aoe2-infantry-2-pikeman.png";
            }

            if (this.player.rating >= 800) {
                return "https://static.wikia.nocookie.net/ageofempires/images/9/96/Manatarms_aoe2DE.png";
            }

            return "https://static.wikia.nocookie.net/ageofempires/images/6/68/MaleVillDE.jpg";

        }
    },
    methods: {
        onPlayerSelected() {
            if (!this.selected) {
                this.selected = true;
                this.$emit('player-selected', this.player)
            }
        },
        fetchProfile() {
            const cachedProfile = localStorage.getItem(this.player.aoe2net_id);
            if (cachedProfile) {
                this.avatar = cachedProfile;
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
                    localStorage.setItem(this.player.aoe2net_id, json.user.avatarUrl);
                    this.avatar = json.user.avatarUrl;
                });
        }
    }
};
</script>