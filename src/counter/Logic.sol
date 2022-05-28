// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "../services/Operation.sol";

library Logic {
    error CounterShouldBePositive(uint256 oldValue);

    function incrementCounter(
        uint256 _value,
        uint256 _toAdd) internal pure returns (uint256){
        return Operation.plus(_value, _toAdd);
    }

    function decrementCounter(
        uint256 _value,
        uint256 _toRemove) internal pure returns (uint256){
        if (_value < _toRemove) {
            revert CounterShouldBePositive({oldValue: _value});
        }
        return Operation.minus(_value, _toRemove);
    }

    function multiplyCounter(
        uint256 _value,
        uint256 _multiplier) internal pure returns (uint256){
        return Operation.multiply(_value, _multiplier);
    }
}
