const Migrations = artifacts.require("SilverToken");

module.exports = function (deployer) {
    deployer.deploy(
      Migrations,
      "SILVER",
      "S"
      );
  };
  