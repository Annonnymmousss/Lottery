// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract

// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions



// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


/**
 * @title A sample Raffle Contract
 * @author Patrick Collins (or even better, you own name)
 * @notice This contract is for creating a sample raffle
 * @dev It implements Chainlink VRFv2.5 and Chainlink Automation
 */


contract Raffle {
    /**
     * errors
     */

    error Raffle_sendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;
    constructor(uint256 entranceFee){
        i_entranceFee=entranceFee;
    }

    function enterRaffle() public payable{
        // revert(msg.value<i_entranceFee , "Not enough eth").       but this cost more gas
        if(msg.value<i_entranceFee){
            revert Raffle_sendMoreToEnterRaffle();
        }

        //in the latest versuin of solidity there is one more efficient method 
        //revert (msg.value<i_entranceFee , Raffle_sendMoreToEnterRaffle()). this is the most cost efficient
    }

    function pickWinner() public {}

    /**
     * Getter Functions
     */

    function getEntranceFee() external view returns (uint256){
        return i_entranceFee;
    }
}