const Migrations = artifacts.require("HorseBetting");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
