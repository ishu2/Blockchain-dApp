pragma solidity ^0.4.2;

contract Election{
   // describe the structure of candidate(how a candidate looks like..)
      struct Candidate{
          uint id;
          string name;
          uint votecount;
      }

   // store accounts that have voted
      mapping(address => bool) public voters;

   // fetch candidates (map canidate with id(uint)),this mapping will give a getter function for fetching candidates
      mapping(uint => Candidate) public candidates;

   // store candidates count
      uint public candidatesCount;

      // voted event
      event votedEvent(
          uint indexed_candidateId
      );

    // constructor
    function Election() public{
       addCandidate("NISHTHA MALHOTRA");
       addCandidate("APPORVA BAYLAN");
       addCandidate("ISHITA RATHI");
    }

    function addCandidate(string _name) private{
        candidatesCount++;
        candidates[candidatesCount]=Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public{
        require(!voters[msg.sender]);
        require(_candidateId>0 && _candidateId<=candidatesCount);
        voters[msg.sender]=true;
        candidates[_candidateId].votecount++;
        votedEvent(_candidateId);
    }

}