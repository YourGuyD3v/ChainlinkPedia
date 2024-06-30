// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console2 } from "forge-std/Test.sol";
import { GetETHPriceS } from "../script/datafeeds/GetETHPriceS.s.sol";
import { GetETHPrice } from "../src/datafeeds/GetETHPrice.sol";

contract getEth is Test {
    GetETHPriceS deployer;
    GetETHPrice getEthPrice;

    function setUp() public {
        deployer = new GetETHPriceS();
        getEthPrice = deployer.run();
    }

    function test_getEthPrice() public {
        int256 price = getEthPrice.getETHPrice();

        console2.log("PRICE | ", price);
    }
}
