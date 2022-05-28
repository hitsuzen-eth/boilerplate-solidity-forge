// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

library Operation {
    function plus(
        uint256 _a,
        uint256 _b) internal pure returns (uint256) {
        return _a + _b;
    }

    function minus(
        uint256 _a,
        uint256 _b) internal pure returns (uint256) {
        return _a - _b;
    }

    function multiply(
        uint256 _a,
        uint256 _b) internal pure returns (uint256) {
        return _a * _b;
    }
}
