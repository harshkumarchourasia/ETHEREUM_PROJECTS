<template>
  
  <div>
    <input type="radio" id="1" value="1" name="horse" v-model="picked" />
    <label for="Horse 1">Horse 1</label>
    <input type="radio" id="2" value="2" name="horse" v-model="picked" />
    <label for="Horse 2">Horse 2</label>
    <input type="radio" id="3" value="3" name="horse" v-model="picked" />
    <label for="Horse 3">Horse 3</label>
    <input type="radio" id="4" value="4" name="horse" v-model="picked" />
    <label for="Horse 4">Horse 4</label>
    <br />
    Selected Horse {{ picked }}<br />
    <input v-model="betAmount" placeholder="bet amount">
<p>Bet amount is: {{ betAmount }} wei</p>
    <button v-on:click="placeBetRequest">Participate</button>
    <br />
    <button v-on:click="verifyBet">Check Betting Amount</button>
    <br />
    <button>check result</button>
     <br />
    <button>Collect Awards</button>
  </div>
 </template>
<script>
import {queryBet,placeBet} from "../SmartContractInstance/Betting.js";

export default {
  name: "Interface",
  data() {
    return { picked: "" ,
    betAmount:0};
  },
  methods: {
    placeBetRequest: function(){
      if(this.picked==""){
        console.log("nothing picked")
        this.$notify("Please pick a horse");
      }
      else if(this.$store.state.userAddress=={}){
        this.$notify("Please select an account from metamask wallet");
      }
      else{
      
        placeBet(this.$store.state.userAddress,this.picked,this.betAmount);
      }
      
    },
    verifyBet: function(){
      (async()=>{ 
      let res;
      res = await queryBet(this.$store.state.userAddress)
      
      let ress = 'bet: '+ String(res)+'wei'
      this.$notify(ress)
    })()
    }
  },
  

};
</script>
