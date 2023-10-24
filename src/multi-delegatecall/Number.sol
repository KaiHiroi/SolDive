// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Number {
    uint256 internal number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
}
