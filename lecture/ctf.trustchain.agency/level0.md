# Level 0
Problem: You will validate the challenge if the isCompleted() function return TRUE.
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract LEVEL {
    bool completed;

    function setCompleted() external {
        completed = true;
    }

    function isCompleted() external view returns(bool) {
        return completed;
    }
}

```
To call the function setCompleted(). First, get the abi of this function. To do this you hash (keccak256) this function signature
```
keccak256('setCompleted()') = 0x2e5295ee0147523dbfeb97df8d7b3e7fa8eb9c9bd144197611727a7a412c2af3
```
And get the first four bytes of this hash '0x2e529522', then create transaction below
```
const Transaction = {
  from: "your address"
  to: "smart contract address"
  value: 0
  data: 0x2e529522
}
```

Level 0 is completed

