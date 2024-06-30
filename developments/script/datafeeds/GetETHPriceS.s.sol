// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Script, console } from "forge-std/Script.sol";
import { GetETHPrice } from "../../src/datafeeds/GetETHPrice.sol";

contract GetETHPriceS is Script {
    GetETHPrice getETHPrice;

    function run() public returns (GetETHPrice) {
        vm.startBroadcast();
        getETHPrice = new GetETHPrice(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        vm.stopBroadcast();

        return getETHPrice;
    }
}
