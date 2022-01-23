<template>
  <div class="home">
    <BettingApp />
  </div>
</template>

<script>
// @ is an alias to /src
import BettingApp from "@/components/BettingApp.vue";
export default {
  name: "Home",
  components: {
    BettingApp,
  },
};
</script>
