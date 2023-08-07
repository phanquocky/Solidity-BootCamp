# level 1
Problem
```
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract LEVEL {
    
    address private privateAddr;
    address privateAddrInput;
    
    constructor() {
//SECRET
    }
    
    function setPrivAddrInput(address _addr) public {
        privateAddrInput = _addr;
    }

    function getPrivAddrInput() external view returns(address) {
        return privateAddrInput;
    }

    function isCompleted() external view returns(bool) {
        return privateAddrInput == privateAddr;
    }
}
```

To solve this problem, you can get the value of the privateAddr. Only one way to get this is load this from the storage of this smartcontract
The privateAddr is the first variable is stored in the storage, so the privateAddr is in slot0. You can get this by using provider or using the tool in the web https://ctf.trustchain.agency/Learn/1

```
address: "smartcontract address"
storage slot: 0x00
result = 0x00000000......
```
And then call the ```setPrivAddrInput``` funtion. To call function with aguments. You can get the function abi 
```
keccak256('setPrivAddrInput(address)') = 0xcc0c3fa7b4c8232f170e60b502a3e8f1d07352120a696ae7cf1c2cb6351f43d2
```
Get first four bytes of this result. And then 32 bytes of the result in slot 0x00 of the storage

```
const Transaction = {
  from: "your address"
  to: "smart contract address"
  value: 0
  data: 0xcc0c3fa7<32bytes of the slot 0x00>
}
```
