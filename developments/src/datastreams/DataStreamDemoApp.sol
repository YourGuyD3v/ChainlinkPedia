// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import { IERC20 } from "@openzeppelin/contracts/interfaces/IERC20.sol";
import { ILogAutomation, Log } from "@chainlink/contracts/src/v0.8/automation/interfaces/ILogAutomation.sol";
import { StreamsLookupCompatibleInterface } from
    "@chainlink/contracts/src/v0.8/automation/interfaces/StreamsLookupCompatibleInterface.sol";
import { IVerifierProxy } from "./interfaces/IVerifierProxy.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE FOR DEMONSTRATION PURPOSES.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

/**
 * @title DataStreamDemoApp
 * @dev This contract is a Chainlink Data Streams Demo App.
 * This contract provides low-latency delivery of low-latency delivery of market data.
 * These reports can be verified onchain to verify their integrity.
 */
contract DataStreamDemoApp {
    address public i_linkToken;
    IVerifierProxy public i_verifier;

    constructor() { }
}
