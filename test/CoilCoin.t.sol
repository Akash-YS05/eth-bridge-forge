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
    function testMint() public {
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100, "ok");
        assertEq(c.balanceOf(0x1535784469C951F4d4F85B582E6646421618cb7A), 0, "ok");

        c.mint(0x1535784469C951F4d4F85B582E6646421618cb7A, 100);
        assertEq(c.balanceOf(0x1535784469C951F4d4F85B582E6646421618cb7A), 100, "ok");
    }
}
