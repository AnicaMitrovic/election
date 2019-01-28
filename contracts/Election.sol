pragma solidity >= 0.4.22 < 0.6.0;

contract Election {
    //Model candidate
    //Store candidate
    //Read candidate
    //Constructor

// declaring state variable as public results in getting getter function for free from solidity, so we can call it like this app.candidate()
    //string public candidate; 
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

//Store candidats with mapping, using key/walue structure
//Fetch candidate with defining the public visibility
    mapping(uint => Candidate) public candidates;
//Store accounts that voted
//Take account addres as a key and give us boolean value, so if we add account address to this mapping and set the value to true, thats how we will keep track of the fact that account has voted
    mapping(address => bool) public voters;

//Store candidates count
    uint public candidatesCount;

    constructor() public {
        //dodavanje svih kandidata koji ce biti na izboru
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private { //private - niko osim nas tj ugovora ne dodaje kandidata na 
        candidatesCount++; //predstavlja id kandidata
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0); // id, name, voteCount
    }


//Election.deployed().then(function(i) {app = i}) //app.vote(1, {from : web3.eth.accounts[0]}) --> from metadata is what solidity captures with msg.sender
    function vote(uint _candidateId) public{
        
        require(!voters[msg.sender]); //if the account haven't voted yet

        require(_candidateId > 0 && _candidateId <= candidatesCount); //checking if account votes for valid candidate

        //record that voter has voted
        voters[msg.sender] = true; //adding sender of function to the list of addresses that have already voted, default value is false

        //update candidate vote count
        candidates[_candidateId].voteCount++;
    }
}