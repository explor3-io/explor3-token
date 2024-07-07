// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.22;

import {Packet} from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/ISendLib.sol";
import {OptionsBuilder} from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/libs/OptionsBuilder.sol";
import {MessagingFee} from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/OApp.sol";
import {MessagingReceipt} from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/OAppSender.sol";
// The unique path location of your OApp
import {EXPLOR3Token} from "src/EXPLOR3Token.sol";
import {TestHelperOz5} from "@layerzerolabs/test-devtools-evm-foundry/contracts/TestHelperOz5.sol";

import "forge-std/console.sol";

/// @notice Unit test for EXPLOR3Token using the TestHelper.
/// @dev Inherits from TestHelper to utilize its setup and utility functions.
contract EXPLOR3TokenTest is TestHelperOz5 {
    using OptionsBuilder for bytes;

    // Declaration of mock endpoint IDs.
    uint16 aEid = 1;
    uint16 bEid = 2;

    // Declaration of mock contracts.
    EXPLOR3Token aEXPLOR3Token; // OApp A
    EXPLOR3Token bEXPLOR3Token; // OApp B

    /// @notice Calls setUp from TestHelper and initializes contract instances for testing.
    function setUp() public virtual override {
        super.setUp();

        // Setup function to initialize 2 Mock Endpoints with Mock MessageLib.
        setUpEndpoints(2, LibraryType.UltraLightNode);

        // Initializes 2 EXPLOR3Tokens; one on chain A, one on chain B.
        address[] memory sender = setupOApps(type(EXPLOR3Token).creationCode, 1, 2);
        aEXPLOR3Token = EXPLOR3Token(payable(sender[0]));
        bEXPLOR3Token = EXPLOR3Token(payable(sender[1]));
    }

    /// @notice Tests the send and multi-compose functionality of EXPLOR3Token.
    /// @dev Simulates message passing from A -> B and checks for data integrity.
    // function test_send() public {
    //     // Setup variable for data values before calling send().
    //     string memory dataBefore = aEXPLOR3Token.data();

    //     // Generates 1 lzReceive execution option via the OptionsBuilder library.
    //     // STEP 0: Estimating message gas fees via the quote function.
    //     bytes memory options = OptionsBuilder.newOptions().addExecutorLzReceiveOption(150000, 0);
    //     MessagingFee memory fee = aEXPLOR3Token.quote(bEid, "test message", options, false);

    //     // STEP 1: Sending a message via the _lzSend() method.
    //     MessagingReceipt memory receipt = aEXPLOR3Token.send{value: fee.nativeFee}(bEid, "test message", options);

    //     // Asserting that the receiving OApps have NOT had data manipulated.
    //     assertEq(bEXPLOR3Token.data(), dataBefore, "shouldn't be changed until lzReceive packet is verified");

    //     // STEP 2 & 3: Deliver packet to bEXPLOR3Token manually.
    //     verifyPackets(bEid, addressToBytes32(address(bEXPLOR3Token)));

    //     // Asserting that the data variable has updated in the receiving OApp.
    //     assertEq(bEXPLOR3Token.data(), "test message", "lzReceive data assertion failure");
    // }
}
