async function init(){
    const Web3 = require('web3')
    const OracleContract = require('./oracle/build/contracts/WinnerOracle.json')

    const web3 = new Web3('http://127.0.0.1:7545')
    const id = await web3.eth.net.getId()
    const deployedNetwork = OracleContract.networks[id]
    const contract = new web3.eth.Contract(
        OracleContract.abi,
        deployedNetwork.address
    )
    //const address = await web3.eth.getAccounts();
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
async function sendResult(rand,id){
    const [contract,web3] = await init()
    
    var privateKey = '4cc148c4b2107d6944c29adb90410cdfc67ea8f86d1464ef649b6427cdf7ba77'
    let data_ = web3.eth.abi.encodeFunctionCall({
        name: 'setWinner',
        type: 'function',
        inputs: [{
            type: 'uint256',
            name: '_winner'
        },
        {
            type: 'address',
            name: '_callerAddress'
        },
        {
            type: 'uint256',
            name: '_id'
        }]
    }, [rand.toString(),'0xafE2715685023F9821C1180792E70fB840b903C0',id.toString()]);
    var tx = {
    nonce: web3.eth.getTransactionCount('0x02A7b7A423eA70897F791c3ba17a544044c28167'),
    gasPrice: '0x09184e72a000',
    gasLimit: '0x27100',
    to: '0x2EdEd01bec172Cc37c00C29d730D663B37256842',
    data: data_
    }

    const signPromise = web3.eth.accounts.signTransaction(tx, privateKey);

    signPromise.then((signedTx) => {  // raw transaction string may be available in .raw or 
        // .rawTransaction depending on which signTransaction
        // function was called
        const sentTx = web3.eth.sendSignedTransaction(signedTx.raw || signedTx.rawTransaction);  sentTx.on("receipt", receipt => {
          // do something when receipt comes back
          console.log("successfull" , receipt)
        });
        sentTx.on("error", err => {
          // do something on transaction error
          console.log("error", err)
        });
      }).catch((err) => {
          console.log("err",err)
        // do something when promise fails
      });

}
async function processRequest(id){
    rand = await getRandomNumberIn1to4()
    sendResult(rand,id)
}
//processRequest(342)

setInterval(async function() {
    try{
    const [contract,web3] = await init()
    const results = await contract.getPastEvents(
        'GetWinnerEvent',
        {
            fromBlock:0,
            toBlock: 'latest'}
    )
    console.log(results[results.length-1].returnValues['id'])
    //processRequest(results[results.length-1].returnValues['id'])
}
    catch(e){
        console.log('unsuccessfull',e)
    }
}, 3000);

/*
async function SetWinnerEventcheck(){
    try{
        const [contract,web3] = await init()
        const results = await contract.getPastEvents(
            'SetWinnerEvent',
            {fromBlock:0,
                toBlock: 'latest'}
        )
        console.log(results);
    }
        catch(e){
            console.log('unsuccessfull',e)
        }
}
SetWinnerEventcheck()
*/