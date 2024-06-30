// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES HARDCODED
 * VALUES FOR CLARITY.
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */
contract GetETHPrice {
    AggregatorV3Interface internal aggregator;

    constructor(address aggre) {
        aggregator = AggregatorV3Interface(aggre);
    }

    /**
     * Returns the latest answer.
     */
    function getETHPrice() public view returns (int256) {
        // prettier-ignore
        (
            /* uint80 roundID */
            ,
            int256 answer,
            /*uint startedAt*/
            ,
            /*uint timeStamp*/
            ,
            /*uint80 answeredInRound*/
        ) = aggregator.latestRoundData();
        return answer;
    }
}
