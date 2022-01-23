import { createStore } from "vuex";

export default createStore({
  state: {
    gameStarted: false,
    userAddress: {},
  },
  mutations: {
    setUserAddress(state, data) {
      state.userAddress = data.metaMaskAddress;
      console.log("address", data.metaMaskAddress);
    },
    hasGameStarted(state, val) {
      state.gameStarted = val;
     
    },
  },
  actions: {},
  modules: {},
});
