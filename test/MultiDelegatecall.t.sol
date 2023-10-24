// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";

import {CallerProxy} from "../src/multi-delegatecall/CallerProxy.sol";
import {CalleeProxy1} from "../src/multi-delegatecall/CalleeProxy1.sol";
import {CalleeProxy2} from "../src/multi-delegatecall/CalleeProxy2.sol";
import {Number} from "../src/multi-delegatecall/Number.sol";

import {FailProxy} from "../src/multi-delegatecall/FailProxy.sol";

contract MultiDelegatecall is Test {
    function test_MultiDelegatecall() public {
        address number = address(new Number());
        address calleeProxy2 = address(new CalleeProxy2());
        address calleeProxy1 = address(new CalleeProxy1());
        address callerProxy = address(new CallerProxy(calleeProxy1));

        CalleeProxy1(payable(callerProxy)).initialize1(calleeProxy2);
        CalleeProxy2(payable(callerProxy)).initialize2(number);

        Number(callerProxy).setNumber(200);
        Number(callerProxy).getNumber();
    }

    function test_Fail_MultiDelegatecall() public {
        address number = address(new Number());
        address calleeProxy1 = address(new FailProxy(number));
        address callerProxy = address(new FailProxy(calleeProxy1));

        vm.expectRevert();
        Number(callerProxy).setNumber(200);
        vm.expectRevert();
        Number(callerProxy).getNumber();
    }

}
