<template>
  <h1 v-if="this.$store.state.gameStarted">
    Betting App
    <br />
    <h6>CURRENT ACCOUNT {{ this.$store.state.userAddress }}</h6>
    Choose a horse and place your bet
    <VueMetamask />
    <Interface />
  </h1>
  <h1 v-else>No current game available 😢</h1>
</template>
<script>
import VueMetamask from "./MetaMask.vue";
import Interface from "./GameInterface.vue";
import {hasStarted} from "../SmartContractInstance/Betting.js";


export default {
  name: "BettingApp",
  components: {
    VueMetamask,
    Interface,
  },
  created() {
    (async () => {
      let res;
      res = await hasStarted();
      this.$store.commit('hasGameStarted',res)
    })();
  },
};
</script>
