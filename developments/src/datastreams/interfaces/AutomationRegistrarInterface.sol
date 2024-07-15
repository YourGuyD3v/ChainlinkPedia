// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import { Common } from "@chainlink/contracts/src/v0.8/llo-feeds/libraries/Common.sol";

/**
 * @dev Defines the parameters required to register a new upkeep.
 * @param name The name of the upkeep to be registered.
 * @param encryptedEmail An encrypted email address associated with the upkeep (optional).
 * @param upkeepContract The address of the contract that requires upkeep.
 * @param gasLimit The maximum amount of gas to be used for the upkeep execution.
 * @param adminAddress The address that will have administrative privileges over the upkeep.
 * @param triggerType An identifier for the type of trigger that initiates the upkeep (`1` for event-based).
 * @param checkData Data passed to the checkUpkeep function to simulate conditions for triggering upkeep.
 * @param triggerConfig Configuration parameters specific to the trigger type.
 * @param offchainConfig Off-chain configuration data, if applicable.
 * @param amount The amount of LINK tokens to fund the upkeep registration.
 */

/**
 * @dev Interface for the Automation Registrar contract.
 */
interface AutomationRegistrarInterface {
    struct RegistrationParams {
        string name;
        bytes encryptedEmail;
        address upkeepContract;
        uint32 gasLimit;
        address adminAddress;
        uint8 triggerType;
        bytes checkData;
        bytes triggerConfig;
        bytes offchainConfig;
        uint96 amount;
    }
    /**
     * @dev Registers a new upkeep contract with Chainlink Automation.
     * @param requestParams The parameters required for the upkeep registration, encapsulated in `RegistrationParams`.
     * @return upkeepID The unique identifier for the registered upkeep, used for future interactions.
     */

    function registerUpkeep(RegistrationParams calldata requestParams) external returns (uint256);
}

interface IFeeManager {
    function getFeeAndReward(
        address subscriber,
        bytes memory unverifiedReport,
        address quoteAddress
    )
        external
        returns (Common.Asset memory, Common.Asset memory, uint256);

    function i_linkAddress() external view returns (address);

    function i_nativeAddress() external view returns (address);

    function i_rewardManager() external view returns (address);
}
