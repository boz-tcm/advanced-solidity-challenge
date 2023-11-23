pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is KaseiCoin, Crowdsale, MintedCrowdsale {/* Inheriting classes for the KaseiCoin and crowdsale standards via Open Zeppelin library implementations
    of Crowdsale and MintedCrowdsale.  KaseiCoin inheritance in this case is non-applicable, although could imagine potential use cases */
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(uint rate, address payable wallet, KaseiCoin token) Crowdsale(rate, wallet, token) public {
        // constructor can stay empty
    }
}
// Compile the KaseiCoinCrowdsale contract using version 0.5.5 of the compiler.

// Check for errors, and debug as needed.

contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    address public kasei_token_address;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    address public kasei_crowdsale_address;

    // Add the constructor.
    constructor(string memory name, string memory symbol, address payable wallet) public {
        // Create a new instance of the KaseiCoin contract.
        // YOUR CODE HERE!
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        // YOUR CODE HERE!

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        // YOUR CODE HERE!
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        // YOUR CODE HERE!

        // Set the `KaseiCoinCrowdsale` contract as a minter
        // YOUR CODE HERE!
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        // YOUR CODE HERE!
    }
}
// Compile the KaseiCoinCrowdsaleDeployer contract using version 0.5.5 of the compiler.

// Check for errors, and debug as needed.