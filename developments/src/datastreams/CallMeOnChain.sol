// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Log Emitter Contract
 * @dev This contract is designed to emit an event whenever the `emitLog` function is called.
 */
contract CallMeOnChain {
    // Define an event that logs the address of the sender who triggered the event.
    event Log(address indexed msgSender, string indexed text);

    /**
     * @dev Emits a `Log` event with the sender's address.
     */
    function emitLog() public {
        emit Log(msg.sender, "Welcome to ON-CHAIN");
    }
}
