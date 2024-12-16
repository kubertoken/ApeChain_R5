//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";  // OpenZeppelin package contains implementation of the ERC 20 standard, which our NFT smart contract will inherit

contract Reviewfy is ERC20 {
    // setting variable for how many of your own tokens are initially put into your wallet, feel free to edit the first number but make sure to leave the second number because we want to make sure our supply has 18 decimals
    uint constant _initial_supply = 100000000 * (10**18); 
    mapping (uint => string) private _surveyHash;

    // Define a struct to store reviewer information
    struct Reviewer {
        address rewardAddress;
        uint256 rewardAmount;
    }

    
    function getSurveyHash(uint approvalId) public view  returns (string memory) {
        return _surveyHash[approvalId];
    }

    // Distribute rewards in the native token (Reviewfy)
    function distributeRewards(
        Reviewer[] memory reviewers,
        uint256 approvalId,
        string memory hash
    ) public {

        require(reviewers.length <= 25, "Too many reviewers");

        uint256 rewardToDistribute = 0;
        for (uint256 i = 0; i < reviewers.length; i++) {
            rewardToDistribute += reviewers[i].rewardAmount;
        }

        require(balanceOf(msg.sender) >= rewardToDistribute, "Insufficient balance");

        for (uint256 i = 0; i < reviewers.length; i++) {
            _transfer(msg.sender, reviewers[i].rewardAddress, reviewers[i].rewardAmount * (10**18));
        }
        _surveyHash[approvalId] = hash;
    }


    /* ERC 20 constructor takes in 2 strings, feel free to change the first string to the name of your token name, and the second string to the corresponding symbol for your custom token name */
    constructor() ERC20("Reviewfy", "R5") {
        _mint(msg.sender, _initial_supply);
    }
}