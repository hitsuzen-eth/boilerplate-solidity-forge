// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Persistence.sol";
import "./Logic.sol";
import {Endpoint as StubExternal} from "../stubExternal/Endpoint.sol";

contract Endpoint is Persistence {
    function incrementByOne() public {
        uint256 value = getValue();

        uint256 valueIncremented = Logic.incrementCounter(value, 1);

        setValue(valueIncremented);
    }

    function decrementByOne() public {
        uint256 value = getValue();

        uint256 valueDecremented = Logic.decrementCounter(value, 1);

        setValue(valueDecremented);
    }

    function doubleEffect(StubExternal stubExternal) public {
        uint256 value = getValue();

        stubExternal.doNothing();

        uint256 valueDoubled = Logic.multiplyCounter(value, 2);

        setValue(valueDoubled);
    }

    function getCounterValue() public view returns (uint256) {
        uint256 value = getValue();

        return value;
    }
}
