async function init(){
    const Web3 = require('web3')
    const OracleContract = require('./OracleContact/build/contracts/Oracle.json')
    
    const web3 = new Web3('http://127.0.0.1:7545')
    const id = await web3.eth.net.getId()
    const deployedNetwork = OracleContract.networks[id]
    const contract = new web3.eth.Contract(
        OracleContract.abi,
        deployedNetwork.address
    )
   
    return [contract,web3]
}
async function getRandomNumberIn1to4(){
    const axios = require('axios')

    let res = "";
    await axios.get('http://www.randomnumberapi.com/api/v1.0/random?min=1&max=4&count=1').then(response=>{
        res = response.data[0]
    }).catch(error=> console.log(error));
return res;

}
async function sendResult(rand,id,_address){
    const [contract,web3] = await init()
    
    var privateKey = '08a953120460e894cb024ffb26200eb3b114858d0b4ffe97e13e2f8d9cd24329'
    var publicKey = '0x483bE0229Ba0306F3Ec04A5A34855f1A960772De'
    OracleContractAddress='0x82086eB2e965ed78B4DD25DdfFB13584d28BD6aE'
    let data_ = web3.eth.abi.encodeFunctionCall({
        name: 'returnRequest',
        type: 'function',
        inputs: [{
            type: 'uint256',
            name: '_randomNumber'
        },
        {
            type: 'address',
            name: '_baseAddress'
        },
        {
            type: 'uint256',
            name: '_requestId'
        }]
    }, [rand.toString(),_address.toString(),id.toString()]);
    
    
    var tx = {
    nonce: web3.eth.getTransactionCount(publicKey),
    gasPrice: '0x09184e72a000',
    gasLimit: '0x27100',
    to: OracleContractAddress,
    data: data_
    }
    

    const signPromise = web3.eth.accounts.signTransaction(tx, privateKey);
    
    
    signPromise.then((signedTx) => {        
        web3.eth.sendSignedTransaction(signedTx.rawTransaction).on('receipt', console.log);
      }).catch(
          (error) => {console.error(error);}
          );
          

}
async function processRequest(id,address){
    rand = await getRandomNumberIn1to4()
    sendResult(rand,id,address)
}
setInterval(async function() {
    try{
        const [contract,web3] = await init()
        const results = await contract.getPastEvents(
            'GetEvent',
            {
                fromBlock:0,
                toBlock: 'latest'
            }
        )
         
        if(results.length>0)
        {
            processRequest(results[results.length-1].returnValues['requestId'],results[results.length-1].returnValues['baseAddress'])
        }
        else{
            console.log("No events emmited yet.")
        }
    }
    catch(e)
    {
        console.log('unsuccessfull',e)
    }
}, 3000);
