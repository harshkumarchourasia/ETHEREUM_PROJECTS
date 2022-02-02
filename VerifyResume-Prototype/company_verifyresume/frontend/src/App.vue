<template>

<VueMetamask />
  <div id="nav">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">Issue Certificate</router-link> | 
    <router-link to="/register_company">Register Company</router-link> | 
    <router-link to="/register_candidate">Register Candidate</router-link>
  </div>
  <router-view />
  <div class = "bottom">CURRENT ADDRESS {{ this.$store.state.userAddress }}
    </div>
</template>
<script>
import VueMetamask from "../src/components/MetaMask.vue";

export default {
   components: {
    VueMetamask,
    
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
.bottom {
  position:fixed;
   left:0px;
   bottom:0px;
   height:30px;
   width:100%;
   background:#999;
}
</style>
