const Migrations = artifacts.require("GoldToken");

module.exports = function (deployer) {
  deployer.deploy(
    Migrations,
    "GOLD",
    "G"
    );
};
