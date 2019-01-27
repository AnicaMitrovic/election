var Election = artifacts.require("./Election.sol");

//declare our contract
contract("Election", function(accounts) { // inject all accounts that exist in our development environment and we can use this account in development purposes
var electionInstance;

    it("Inicializes with 2 candidates", function() {
        return Election.deployed().then(function(i) {
            return i.candidatesCount();
        }).then(function(count){ 
            assert.equal(count, 2);
        });
    });

    it("Initializes candidates with correct values", function() {
        return Election.deployed().then(function(i) {
            electionInstance = i;
            return electionInstance.candidates(1);
        }).then(function(candidate){ 
            assert.equal(candidate[0], 1, "correct id");
            assert.equal(candidate[1], "Candidate 1", "correct name");
            assert.equal(candidate[2], 0, "correct votes count");
            return electionInstance.candidates(2);
        }).then(function (candidate) {
            assert.equal(candidate[0], 2, "correct id");
            assert.equal(candidate[1], "Candidate 2", "correct name");
            assert.equal(candidate[2], 0, "correct votes count");
        });
    });
});