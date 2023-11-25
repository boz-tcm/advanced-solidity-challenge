pragma solidity ^0.5.0;

/* Creating the KaseiCoin Token Contract as an ERC-20 token:

    Import the provided KaseiCoin.sol starter file into the Remix IDE */

//  Import the following contracts from the OpenZeppelin library:
//    * `ERC20`
//    * `ERC20Detailed`
//    * `ERC20Mintable`
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

/* Define a contract for the KaseiCoin token that’s named KaseiCoin, and have the contract inherit the three contracts just imported from OpenZeppelin.*/

contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable { /* Inheriting classes for fungible ethereum token standard #20 via Open Zeppelin library implementations
                                                            of ERC20, ERC20Detailed, ERC20Mintable. */
    // address payable owner;    
    
    // // Modifier block is already taken care of by introducing ERC20Mintable class inheritance above.  However, included for general implementation reference.
    // modifier onlyOwnerMintsPermission() { //Requires owner validation in order to execute minting function, c.f. https://www.geeksforgeeks.org/solidity-function-modifiers/
    //     require(owner == msg.sender, "you are not allowed to mint!");
    //     _; //If evaluates to True and wildcard '_' placed at end of modifier, as here, will allow function where modifier invoked, to execute, otherwise, will preempt function execution.
    // }
    /* Within the KaseiCoin contract, creating a constructor with the following parameters: name, symbol, and initial_supply.
    As part of the constructor definition, adding a call to the constructor of the ERC20Detailed contract, passing the name,
    symbol, and 18 parameters. (Note: 18 is the value for the decimal parameter: "Tokens usually opt for a value of 18, imitating
    the relationship between ether and wei.") */

    /* "A constructor is a special method in any object-oriented programming language which gets called whenever an object of a class is initialized.
    It is totally different in case of Solidity, Solidity provides a constructor declaration inside the smart contract and it invokes only once when the contract
    is deployed and is used to initialize the contract state. A default constructor is created by the compiler if there is no explicitly defined constructor."
    c.f. https://www.geeksforgeeks.org/solidity-constructors */

    /* ERCDetailed inherited constructor details, see ERCDetailed.sol lines 18-22
    /* Sets the values for `name`, `symbol`, and `decimals`. All three of
     * these values are immutable: they can only be set once during
     * construction. */
    
    constructor(string memory name, string memory symbol, uint initial_supply) ERC20Detailed(name, symbol, 18) public {
        // owner = msg.sender;
        /* mint(owner, initial_supply); /* Inheriting the 'mint' function from ERC20Mintable, which in turns inherits the more generic,
        minting mechanism-agnostic '_mint' function from ERC20, c.f. ERC20 code file comments */
    }
}
// Compile the KaseiCoin contract using version 0.5.5 of the compiler.

// Check for errors, and debug as needed.