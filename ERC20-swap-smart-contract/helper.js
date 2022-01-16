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
