async function init(){
    const Web3 = require('web3')
    const OracleContract = require('./betting/build/contracts/HorseBetting.json')

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
setInterval(async function() {
    try{
    const [contract,web3] = await init()
    const results = await contract.getPastEvents(
        'ReceivedNewRequestIdEvent',
        {
            fromBlock:0,
            toBlock: 'latest'}
    )
    console.log(results)
    //processRequest(results[results.length-1].returnValues['id'])
}
    catch(e){
        console.log('unsuccessfull',e)
    }
}, 3000);