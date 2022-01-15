const Migrations = artifacts.require("PlatinumToken");

module.exports = function (deployer) {
    deployer.deploy(
      Migrations,
      "PLATINUM",
      "P"
      );
  };
  