// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {OFT} from "@layerzerolabs/lz-evm-oapp-v2/contracts/oft/OFT.sol";

//     ,╗Æ▓╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣▓W╥        ,╗Æ▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣▓▒φ╥
//    [╬╬╬╬╬╬╣╣╣╣╣╣╣╣╣╣╣╣╣╣╝╝╝╣╣╬╬╬╬╬╬╬▓╗    ╓▓╬╬╬╬╬╬╬╣╣╣╣╣╣╣╣╣╣╣╣╣╣╣╣╣╣╣╬╬╬╬╬╬▒
//    ╟╬╬╬╬╬                       "╙╣╬╬╬▓_  ╙╬╬╬╝╙`                      ╟╬╬╬╬╬
//  ╓╥╥▄▄▄▄▄╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥,      '╣╬╬╬W   ╙      ,╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥╥▄▄▄▄▄▄╥╥_
// ╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▌       ╣╬╬╬▓╥        ╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬
// `╙╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╙       ╣╬╬╬╬╬╬▓,      ╙╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜╜^
//     Æ▒▒▒▒R                       _╗╣╬╬╬╬╬╬╬╬╬▓╥                       j▒▒▒▒▒
//     ╬╬╬╬╬▓╗╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╥╗φ▓╬╬╬╬╬╣^ ╚╬╬╬╬╬▓▒╗╥╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╓╥╣╬╬╬╬╬
//     '╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╝^     ╙╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╣╜

/**
 * @title EXPLOR3Token
 * @author lumen-limitless
 * @notice ERC20 token for the EXPLOR3 ecosystem
 * @dev implements LayerZero OFT standard for multi-chain compatibility
 */
contract EXPLOR3Token is Ownable, OFT {
    // ===============================================================
    //                           STORAGE
    // ===============================================================

    // ===============================================================
    //                           CONSTRUCTOR
    // ===============================================================

    constructor(
        string memory name_,
        string memory symbol_,
        address lzEndpoint_,
        address delegate_,
        address owner_,
        uint256 initialSupply_
    ) OFT(name_, symbol_, lzEndpoint_, delegate_) Ownable(owner_) {
        _mint(msg.sender, initialSupply_);
    }
}
