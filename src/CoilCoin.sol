// SPDX-License-Identifier: Unlicense

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity ^0.8.13;

contract CoilCoin is ERC20 {
    uint public num;

    constructor(uint _initialValue) ERC20("coil", "COIL") {
        // 
    } 

    function increment() public {
        num++;
    }

    function decrement() public {
        num--;
    }
}
