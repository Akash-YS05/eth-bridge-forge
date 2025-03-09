// SPDX-License-Identifier: Unlicense

//ERC-20 - lets us create token on blockchain
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity ^0.8.13;

contract CoilCoin is ERC20 {
   address owner;

    constructor(uint _initialValue) ERC20("coil", "COIL") {
        //_mint comes from ERC20 parent class
        _mint(msg.sender, _initialValue);
        owner = msg.sender; 
    } 

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner);    
        _mint(to, amount);
    }
}
