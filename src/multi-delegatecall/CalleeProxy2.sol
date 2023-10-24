// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract CalleeProxy2 is Proxy {
    function initialize2(address _impl) public {
        bytes32 slot = keccak256("implementation");
        assembly {
            sstore(slot, _impl)
        }
    }

    function _implementation() internal view override returns (address implementation) {
        bytes32 slot = keccak256("implementation");
        assembly {
            implementation := sload(slot)
        }
    }
}
