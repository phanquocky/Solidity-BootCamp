# Level 2
Problem
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract LEVEL {
    
    mapping (address => uint) privateNumber;
    uint privateNumberInput;
    
    constructor() {
//SECRET
        // privateNumber[0xAeC188C0b02b99811a1422D42806efbD148A5e54] = ???
    }

    function getPrivNumber() external view returns(uint) {
        return privateNumberInput;
    }

    function setPrivateNumberInput(uint _number) external {
        privateNumberInput = _number;
    }
    
    function isCompleted() external view returns(bool) {
        return privateNumberInput == privateNumber[0xAeC188C0b02b99811a1422D42806efbD148A5e54];
    }
}
```
To solve this problem you can get the value of ```privateNumber[0xAeC188C0b02b99811a1422D42806efbD148A5e54]```. The way mapping in solidity store in storage is the slot of the `key` and `slot` is `keccak256(hex(key) + hex(slot))`. In the above problem the `key = 0xAeC188C0b02b99811a1422D42806efbD148A5e54` and `slot = 0` to get the slot of the secret number 
```
keccak256(0x000000000000000000000000AeC188C0b02b99811a1422D42806efbD148A5e540000000000000000000000000000000000000000000000000000000000000000) = 0xfdfbea558d8ae909b3496bc1255a8c279a8d3d9de48629a7a0b142088e1f6d18
```
And get the value at this slot
```
address: "smartcontract address"
storage slot: 0xfdfbea558d8ae909b3496bc1255a8c279a8d3d9de48629a7a0b142088e1f6d18
result = 0x00000000......
```