// SPDX-License-Identifier: MIT 
pragma solidity 0.8.21;
import "forge-std/Test.sol";

import {ERC20} from "../src/ERC20.sol";
contract TokenTest is Test {
  ERC20 token;

  uint256 private constant _decimal = 10 ** 18;
  uint256 private constant _totalSupply = 10**8 * _decimal;
  address private _deployer;

  address private _tokenAddress;

  function setUp() public{
    _deployer = vm.addr(0x1234);

    vm.startPrank(_deployer); // Sets all subsequent calls' msg.sender to be the input address until `stopPrank` is called

    token = new ERC20(_totalSupply, "quocky token" , "QTK");
    _tokenAddress = address(token);
  }
  // tes total supply function (TS)
  function testTS_ShouldReturnTS_WhenGetTS() public {
    //setUp
    //execution
    uint256 totalSupply = token.totalSupply();
    //assert
    assertEqUint(_totalSupply, totalSupply); 
  }

  function testBalance_ShouldReturnBlance_WhenCallToBlance() public {
    //setUp
    //execution
    uint256 deployerBalance = token.balanceOf(_deployer);
    //assert
    assertEqUint(deployerBalance, _totalSupply);
  }

  // fuzzing tests
  function testTransfer_ShouldTransferToken_WhenCallToTransfer(uint amount) public {
    vm.assume(amount > 0);
    vm.assume(amount < 10000);
    //setUp
    address Alice = vm.addr(0x4321);
    //execution
    bool s = token.transfer(Alice, amount * _decimal);
    require(s);
    //assert
    uint256 AliceBalance = token.balanceOf(Alice);
    uint256 senderBalance = token.balanceOf(_deployer);

    // vm.expectEmit(true, true, true,true);          ?? check later
    // emit token.Transfer(_deployer, Alice, amount);

    assertEqUint(AliceBalance, amount * _decimal);
    assertEqUint(senderBalance, _totalSupply - (amount * _decimal));
  }
}