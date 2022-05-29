pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Endpoint as Counter} from "src/counter/Endpoint.sol";
import {Endpoint as StubExternal} from "src/stubExternal/Endpoint.sol";

contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function testIncrementByOne(uint8 multipleIncrement) public {
        assertEq(counter.getCounterValue(), 0);
        
        counter.incrementByOne();
        assertEq(counter.getCounterValue(), 1);
        
        for (uint i = 0; i < multipleIncrement; i++) {
            counter.incrementByOne();
        }
        assertEq(counter.getCounterValue(), uint256(multipleIncrement) + 1);
    }

    function testFailDecrementByOne() public {
        assertEq(counter.getCounterValue(), 0);
        
        counter.decrementByOne();
    }

    function testDecrementByOne() public {
        assertEq(counter.getCounterValue(), 0);
        
        counter.incrementByOne();
        counter.decrementByOne();
        assertEq(counter.getCounterValue(), 0);
        
        counter.incrementByOne();
        counter.incrementByOne();
        counter.incrementByOne();
        counter.decrementByOne();
        counter.decrementByOne();
        assertEq(counter.getCounterValue(), 1);
    }

    function testDoubleEffect() public {
        StubExternal stubExternal = new StubExternal();
        assertEq(counter.getCounterValue(), 0);
        
        counter.doubleEffect(stubExternal);
        assertEq(counter.getCounterValue(), 0);
        
        counter.incrementByOne();
        counter.doubleEffect(stubExternal);
        assertEq(counter.getCounterValue(), 2);
        
        counter.doubleEffect(stubExternal);
        counter.doubleEffect(stubExternal);
        assertEq(counter.getCounterValue(), 8);
    }
}