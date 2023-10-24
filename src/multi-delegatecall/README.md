# Multi Delegatecall

Implementing a delegatecall to a Proxy, which in turn performs a delegatecall to the implementation address, will result in a Revert if set up directly.
```bash
forge test --mt test_Fail_MultiDelegatecall
```

This issue arises because when a delegatecall is initiated from the Caller to the Callee, and the Callee then initiates a delegatecall to the implementation address stored in the Caller's storage (which is the address of the Callee itself), an infinite loop is triggered.

By altering the storage slot for the destination with each Proxy, it becomes possible to carry out Proxy forwarding across multiple layers while still maintaining proper access.
```bash
forge test --mt test_MultiDelegatecall
```
