const terminator = artifacts.require("./terminator.sol")

module.exports = function(deployer) {
	deployer.deploy(terminator);
};