# Optimizing
## Use immutable and constant
``` solidity
uint256 var1 = 100 // storage slot in EVM storage
uint256 constant var2 = 100 // not in slot of storage
// Reason for this in the compile time the var2 is replaced to 100
uint256 immutable var3;

The constant when declare is initialize the default value for this, but the immutable variable it will be  assign the first time and then is convert to constant
```
## Pack your variable
## Using mapping instead of array if possible
## Use fixed size array
## Avoid large Arrays or iterators
## Free up unused Storage
## Cache in memory 
## Store data in calldata instead of memory for read only param
## Cache in stack if memory read multiple time (>100)
## Use uint8 can increase gas cost
## Add view and pure 
## Batch operation
## Enable solidity compiler optimizer
## Minimize On-chain data
## Use unchecked
## Use uint256(a) !=0 instead a > 0
## Use libraries
Can use the libraries if it have deployed, but it dosen't mean external call ???
## Remove reduntdant checks
## Use assembly code
## Keep 1wei of tokens inside a smart contract