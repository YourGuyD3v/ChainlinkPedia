// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import { Test, console2 } from "forge-std/Test.sol";
import "@chainlink/contracts/src/v0.8/mocks/VRFCoordinatorV2Mock.sol";
import { MockFunctionsRouter } from "../mock/MockFunctionRouter.sol";
import { StarWar } from "../../src/functions/StarWar.sol";

contract TestStarWar is Test {
    VRFCoordinatorV2Mock vrf;
    MockFunctionsRouter router;
    StarWar starwar;

    uint96 public constant BASE_FEE = 100_000_000_000_000_000;
    uint96 public constant GAS_PRICE_LINK = 1_000_000_000;
    address public constant ROUTER = 0xb83E47C2bC239B3bf370bc41e1459A34b41238D0;
    bytes32 public constant DON_ID = 0x66756e2d706f6c79676f6e2d6d756d6261692d31000000000000000000000000;
    uint64 public subID;
    string source;

    function setUp() public {
        router = new MockFunctionsRouter();
        starwar = new StarWar(address(router));
        vrf = new VRFCoordinatorV2Mock(BASE_FEE, GAS_PRICE_LINK);
    }

    modifier CFA() {
        testCreateAndFundSubcriptionAndAddConsumer();
        _;
    }

    function testCreateAndFundSubcriptionAndAddConsumer() public {
        subID = vrf.createSubscription();
        vrf.fundSubscription(subID, 1_000_000_000_000_000_000);
        vrf.addConsumer(subID, address(starwar));
        bool isConsumer = vrf.consumerIsAdded(subID, address(starwar));
        assert(isConsumer == true);
    }

    function testSendRequest() public CFA {
        string[] memory ARGS = new string[](1);
        ARGS[0] = "1";
        starwar.sendRequest(1, ARGS);
        string memory ch = starwar.character();
        // string memory expectedCh = "Luke Skywalker";
        // assertEq(ch, expectedCh);
        console2.log(ch);
    }
}
