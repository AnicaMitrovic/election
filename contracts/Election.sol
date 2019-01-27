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

}