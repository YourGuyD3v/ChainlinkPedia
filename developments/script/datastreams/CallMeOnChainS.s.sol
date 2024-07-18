// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Script, console } from "forge-std/Script.sol";
import { CallMeOnChain } from "../../src/datastreams/CallMeOnChain.sol";
import { CountWithLog } from "../../src/datastreams/CountWithLog.sol";

contract CallMeOnChainS is Script {
    CallMeOnChain callmeONCHAIN;
    CountWithLog countWithLog;

    function run() public returns (CallMeOnChain, CountWithLog) {
        vm.startBroadcast();

        // Deploy CallMeOnChain
        callmeONCHAIN = new CallMeOnChain();

        // Deploy CountWithLog
        countWithLog = new CountWithLog();

        vm.stopBroadcast();
        return (callmeONCHAIN, countWithLog);
    }
}
