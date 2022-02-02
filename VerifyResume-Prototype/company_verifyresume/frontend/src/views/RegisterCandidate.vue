<template>
  <div class="RegisterCandidate">
    Please enter your name
    <input v-model="message" placeholder="">

<button v-on:click="addCandidate">SUBMIT</button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
    data(){
        return {
            message:""
        }
    },
    methods:{
        addCandidate(){
        var form = new FormData()
        form.append("name",this.message)  
        form.append("address" ,this.$store.state.userAddress)  
        console.log(form);
        axios.post("http://127.0.0.1:5000/new_candidate", form  )
        }
    },
  name: "RegisterCandidate",

};
</script>