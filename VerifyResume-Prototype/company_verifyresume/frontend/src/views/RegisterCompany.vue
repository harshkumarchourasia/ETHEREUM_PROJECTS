<template>
  <div class="RegisterCompany">
 Please enter your company name 
  <br /> 
  <input v-model="message" placeholder="">
<button v-on:click="addCompany">SUBMIT</button>

  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: "RegisterCompany",
    data(){
        return {
            message:""
        }
    },
     methods:{
        addCompany(){
        var form = new FormData()
        form.append("name",this.message)    
        form.append("address" ,this.$store.state.userAddress)  
        axios.post("http://127.0.0.1:5000/new_company", form )
        }
    },
};
</script>