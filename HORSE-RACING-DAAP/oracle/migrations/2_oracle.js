const WinnerOracle = artifacts.require("WinnerOracle");

module.exports = function (deployer) {
  deployer.deploy(WinnerOracle);
};
