// SPDX-License-identifier:MIT
pragma solidity ^0.8.21;
contract Voting{
    address public owner;
    mapping(address => bool)public hasVoted;
    mapping (string => uint256) public votesRecieved;
    event Voted(address indexed voter, string candidate);
    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    constructor(){
        owner = msg.sender;
    }

    function vote(string memory candidate) external {
        require(!hasVoted[msg.sender], "You have already voted");
        votesRecieved[candidate]++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender,candidate);
    }
    function getVotesForCandidates(string memory candidate) external view returns (uint256)
        {return votesRecieved[candidate];
    }
    function getowner() external view returns (address) {
        return owner;
    }
        
}