// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract CalleeProxy1 is Proxy {
    function initialize1(address _calleeProxy2) public {
        bytes32 slot = keccak256("CalleeProxy2");
        assembly {
            sstore(slot, _calleeProxy2)
        }
    }

    function _implementation() internal view override returns (address implementation) {
        bytes32 slot = keccak256("CalleeProxy2");
        assembly {
            implementation := sload(slot)
        }
    }
}
