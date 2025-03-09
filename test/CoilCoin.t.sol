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

    //test minting the token to an address
    function testMint() public {
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100, "ok");
        assertEq(c.balanceOf(0x1535784469C951F4d4F85B582E6646421618cb7A), 0, "ok");

        c.mint(0x1535784469C951F4d4F85B582E6646421618cb7A, 100);
        assertEq(c.balanceOf(0x1535784469C951F4d4F85B582E6646421618cb7A), 100, "ok");
    }

    //test transfering tokens to an address by asserting the change in balance
    function testTransfer() public {
        c.mint(address(this), 100);
        c.transfer(0x1535784469C951F4d4F85B582E6646421618cb7A, 50);

        assertEq(c.balanceOf(address(this)), 50, "ok");
        assertEq(c.balanceOf(0x1535784469C951F4d4F85B582E6646421618cb7A), 50, "ok");

        //change the address of the one who is calling the contract
        vm.prank(0x1535784469C951F4d4F85B582E6646421618cb7A);
        c.transfer(address(this), 50);
        assertEq(c.balanceOf(address(this)), 100, "ok");
    }

    function testApprovals() public {
        c.mint(address(this), 100);

        //the address can only spend 10 tokens
        c.approve(0x1535784469C951F4d4F85B582E6646421618cb7A, 10);

        vm.prank(0x1535784469C951F4d4F85B582E6646421618cb7A);
        c.transferFrom(address(this), 0x1535784469C951F4d4F85B582E6646421618cb7A, 5);

        assertEq(c.balanceOf(address(this)), 95, "ok");
        assertEq(c.balanceOf(0x1535784469C951F4d4F85B582E6646421618cb7A), 5, "ok");
        assertEq(c.allowance(address(this), 0x1535784469C951F4d4F85B582E6646421618cb7A), 5, "ok");
    }
}
