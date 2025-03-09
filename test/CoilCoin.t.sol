// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/CoilCoin.sol";

contract TestContract is Test {
    CoilCoin c;

    function setUp() public {
        c = new CoilCoin(0);
    }

    //EXAMPLE TESTS
    // function testInc() public {
    //     c.increment();
    //     c.increment();
    //     assertEq(c.num(), uint(7), "ok");
    // }

    // function testDec() public {
    //     c.decrement();
    //     c.decrement();
    //     assertEq(c.num(), uint(3), "ok");
    // }
    // function test_RevertWhen_Underflow() public {
    //     vm.expectRevert();
    //     c.decrement();
    //     c.decrement();
    //     c.decrement();
    //     c.decrement();
    //     c.decrement();
    //     c.decrement();
    // }

    function testSimple() public {
        assertEq(uint(2), uint(2), "ok");
    }
}
