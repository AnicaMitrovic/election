pragma solidity >= 0.4.22 < 0.6.0;

contract Election {
    //Store candidate
    //Read candidate
    //Constructor

// declaring state variable as public results in getting getter function for free from solidity, so we can call it like this app.candidate()
    string public candidate; 

    constructor() public {
        candidate = "Candidate 1";
    }

}