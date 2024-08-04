// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Script, console } from "forge-std/Script.sol";
import { StarWar } from "../../src/functions/StarWar.sol";

contract StarWarS is Script {
    StarWar starwar;

    function run() public returns (StarWar) {
        vm.startBroadcast();

        // Deploy StarWar
        starwar = new StarWar();

        vm.stopBroadcast();
        return starwar;
    }
}
