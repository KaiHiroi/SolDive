// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";
import {ERC1967Utils} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";

contract FailProxy is Proxy {
    constructor(address _calleeProxy) {
        ERC1967Utils.upgradeToAndCall(_calleeProxy, bytes(""));
    }

    function _implementation() internal view override returns (address) {
        return ERC1967Utils.getImplementation();
    }
}
