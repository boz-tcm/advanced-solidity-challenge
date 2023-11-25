pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
// Contract 'KaseiCoinCrowdsale' represents our actual crowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {/* Inheriting classes for the crowdsale standards via Open Zeppelin library implementations
    of Crowdsale and MintedCrowdsale. */
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(uint rate, address payable wallet, KaseiCoin token) Crowdsale(rate, wallet, token) public {
        /* constructor can stay empty, as we are completely leveraging inheritance of the Crowdsale constructor to create our constructor, and therefore no additional
        functionality necessary. */
    }
}
// Compile the KaseiCoinCrowdsale contract using version 0.5.5 of the compiler.

// Check for errors, and debug as needed.

// Contract 'KaseiCoinCrowdsaleDeployer' helps us launch and orchestrate our crowdsale
contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    address public kasei_token_address;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    address public kasei_crowdsale_address;

    // Add the constructor.
    constructor(string memory name, string memory symbol, address payable wallet, uint initial_supply, uint rate) public {
        // Instantiate a KaseiCoin token.  Creating a new instance of the KaseiCoin token.
        initial_supply = 0; // Initialize token supply variable
        KaseiCoin token = new KaseiCoin(name, symbol, initial_supply); // Address attribute included in this contract instance, will be referenced below.

        // Assign the KaseiCoin token's contract address to the `kasei_token_address` variable.
        kasei_token_address = address(token);

        // Instantiate a KaseiCoin crowdsale.  Creating a new instance of the KaseiCoin crowdsale.  Wallet address will be provided by end-user. Token will pass from token instance above.
        rate = 1; // Initialize token offer rate variable as 1:1 (token:ether)
        KaseiCoinCrowdsale kasei_coin_crowdsale = new KaseiCoinCrowdsale(rate, wallet, token); // Adddress attribute included in this contract instance.

        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        kasei_crowdsale_address = address(kasei_coin_crowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter. Have to give minter permission to our crowdsale contract address since role currently limited to the token contract address itself.
        token.addMinter(kasei_crowdsale_address);
        
        /* Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role. Here we are actually removing the original minter role associated with the token contract address itself.
        We also have to remove, or comment out, the minting function call in the KaseiCoin.sol constructor since it references the msg.sender which is associated with the
        deployer address and we don't want to duplicate minting. */
        token.renounceMinter();
    }
}
// Compile the KaseiCoinCrowdsaleDeployer contract using version 0.5.5 of the compiler.

// Check for errors, and debug as needed.