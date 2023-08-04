// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {IERC20} from './IERC20.sol';

contract ERC20 is IERC20 {
  uint256 private _totalSupply;
  mapping(address => uint256) private _balanceOf;
  mapping(address => mapping(address => uint256)) _allowance;
  address private _owner;

  string private _name;
  string private _symbol;

  constructor(uint256 totalSupply_, string memory name_ , string memory symbol_) {
    _totalSupply = totalSupply_;
    _name = name_;
    _symbol = symbol_;
    _owner = msg.sender;
    _balanceOf[msg.sender] = _totalSupply;
  } 

  function owner() public view returns(address) {
    return _owner;
  }

  function changeOwner(address newOwner) public returns(bool) {
    require(msg.sender == _owner, "ERC20: not owner");
    require(newOwner != address(0));
    _owner = newOwner;
    return true;
  }

  function totalSupply() external view returns(uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) external view returns (uint256){
    return _balanceOf[account];
  }

  function transfer(address to, uint256 value) external returns (bool){
    require(value > 0, "require value greater than 0");
    require(_balanceOf[msg.sender] >= value, "require your balance is greater than or equal amount");

    _balanceOf[msg.sender] -= value;
    _balanceOf[to] += value;

    emit Transfer(msg.sender, to, value);
    return true; 
  }

  function allowance(address owner_, address spender_) external view returns (uint256){
    return _allowance[spender_][owner_];
  }

  function approve(address spender, uint256 value) external returns (bool){
    // require(value > 0, "require value greater than 0");        // don't need to check- because check at the transfer(from , to, value)
    // require(_balanceOf[msg.sender] >= value, "require your balance is greater than or equal amount");

    // but check the spender, and owner is zero address ??? 
    require(spender != address(0));
    _allowance[spender][msg.sender] = value;

    emit Approval(msg.sender, spender,  value);
    return true;
  }

  function transferFrom(address from, address to, uint256 value) external returns (bool){
    require(value > 0, "require value greater than 0");
    require(_balanceOf[from] > 0);
    require(_allowance[msg.sender][from] >= value, "require your balance is greate than or equal amount");
    _allowance[msg.sender][from] -= value;
    _balanceOf[from] -= value;

    _balanceOf[to] += value;

    emit Transfer(from, to, value);
    return true;
  }


}
