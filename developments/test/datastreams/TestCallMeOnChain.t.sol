// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console2 } from "forge-std/Test.sol";
import { CallMeOnChainS } from "../../script/datastreams/CallMeOnChainS.s.sol";
import { CallMeOnChain } from "../../src/datastreams/CallMeOnChain.sol";
import { CountWithLog } from "../../src/datastreams/CountWithLog.sol";

contract TestCallMeOnChain is Test {
    CallMeOnChainS deployer;
    CallMeOnChain callMeOnChain;
    CountWithLog countWithLog;

    function setUp() public {
        deployer = new CallMeOnChainS();
        (callMeOnChain, countWithLog) = deployer.run();
    }

    function test_emitLog() public {
        callMeOnChain.emitLog();

        // before registration count will be equal to 0
        uint256 count = countWithLog.counted();

        assert(count == 0);

        // after registration count will increment from 0
    }
}
