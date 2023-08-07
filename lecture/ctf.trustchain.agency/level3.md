# Level 3
Problem
``` solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract LEVEL {
    
    uint[] privateNumbers;
    uint privateNumberInput;
    
    constructor() {
//SECRET
//SECRET
//SECRET
        // privateNumber[2] = ???
    }

    function getPrivNumber() external view returns(uint) {
        return privateNumberInput;
    }

    function setPrivateNumberInput(uint _number) external {
        privateNumberInput = _number;
    }

    function isCompleted() external view returns(bool) {
        return privateNumberInput == privateNumbers[2];
    }
}
```

To solve this problem is get the value of the  `privateNumber[2]`.`privateNumbers` array is stored at slot 0,  the way dynamic array store in the storage is at slot(0) store the length of the array. And the `arr[0]` is stored at `keccak(0x000...00)` and the `arr[1]` is stored at `keccak(0x000...00) + 1`, and then find the slot of the `privateNumber[2]`