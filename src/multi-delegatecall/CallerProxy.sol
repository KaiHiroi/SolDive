// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract CallerProxy is Proxy {
    constructor(address _calleeProxy1) {
        bytes32 slot = keccak256("CalleeProxy1");
        assembly {
            sstore(slot, _calleeProxy1)
        }
    }

    function _implementation() internal view override returns (address implementation) {
        bytes32 slot = keccak256("CalleeProxy1");
        assembly {
            implementation := sload(slot)
        }
    }
}
