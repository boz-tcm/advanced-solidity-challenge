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

contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable { //Inheriting classes for fungible token standard #20 via Open Zeppelin library implementations
                                                            //of ERC20, ERC20Detailed, ERC20Mintable.
    address payable owner;    
    modifier onlyOwnerMintsPermission() { //Requires owner validation in order to execute minting function, c.f. https://www.geeksforgeeks.org/solidity-function-modifiers/
        require(owner == msg.sender, "you are not allowed to mint!");
        _; //If evaluates to True and wildcard '_' placed at end of modifier, as here, will allow function where modifier invoked, to execute, otherwise, will preempt function execution.
    }


                                                    









}


    
    As part of the constructor definition, add a call to the constructor of the ERC20Detailed contract, passing the name, symbol, and 18 parameters.
    (Recall that 18 is the value for the decimal parameter.)

    Create a constructor for the KaseiCoin contract and have the contract inherit the libraries that you imported from OpenZeppelin.

    In the KaseiCoin contract, add a constructor with the following parameters: name, symbol, and initial_supply.

    "A constructor is a special method in any object-oriented programming language which gets called whenever an object of a class is initialized.
    It is totally different in case of Solidity, Solidity provides a constructor declaration inside the smart contract and it invokes only once when the contract
    is deployed and is used to initialize the contract state. A default constructor is created by the compiler if there is no explicitly defined constructor."
    c.f. https://www.geeksforgeeks.org/solidity-constructors */






    /*Compiling the contract using version 0.5.5 of the compiler.

    Check for errors, and debug them as needed.*/
