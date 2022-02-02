<template>
  <div class="about">
    <h1>Issue certificate</h1>
    Company
    <input v-model="company" placeholder="">
    <br />
    Candidate
    <input v-model="candidate" placeholder="">
    <br />
    designation
    <input v-model="designation" placeholder="">
    <br />

    
    <button v-on:click="submit">SUBMIT</button>

  </div>

</template>
<script>
import axios from 'axios'

export default {
    data(){
        return {
            company:"",
            candidate:"",
            designation:""
        }
    },
    methods:{
        submit(){
        var form = new FormData()
        form.append("company",this.company)  
        form.append("candidate" ,this.candidate)
        form.append("token_id" ,0)  
        console.log(form);
        axios.post("http://127.0.0.1:5000/add_certificate", form  )
        }
    },
};
</script>