const Migrations = artifacts.require("BaseContract");

module.exports = function (deployer) {
  deployer.deploy(Migrations,'0x82086eB2e965ed78B4DD25DdfFB13584d28BD6aE');
};
