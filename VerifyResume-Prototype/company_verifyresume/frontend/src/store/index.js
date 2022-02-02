import { createStore } from "vuex";

export default createStore({
  state: { userAddress: {}},
  mutations: {
    setUserAddress(state, data) {
      state.userAddress = data.metaMaskAddress;
      console.log("address", data.metaMaskAddress);
    }
  },
  actions: {},
  modules: {},
});
