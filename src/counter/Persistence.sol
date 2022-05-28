// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Persistence {
    uint256 private value;

    constructor() {
        value = 0;
    }

    function getValue() internal view returns (uint256) {
        return value;
    }

    function setValue(uint256 _value) internal {
        value = _value;
    }
}
