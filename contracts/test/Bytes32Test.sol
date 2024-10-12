//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

contract Bytes32Test {
    //0x0000000000000000000000000000000000000000000000000000000000000011
    //0x7465737400000000000000000000000000000000000000000000000000000000
    bytes32 public myBytes;

    function getLenght() public pure returns (uint256) {
        string memory str = "0x7465737400000000000000000000000000000000000000000000000000000000";
        return strlen(str);
    }

    function strlen(string memory s) public pure returns (uint256) {
        uint256 len;
        uint256 i = 0;
        uint256 bytelength = bytes(s).length;
        for (len = 0; i < bytelength; len++) {
            bytes1 b = bytes(s)[i];
            if (b < 0x80) {
                i += 1;
            } else if (b < 0xE0) {
                i += 2;
            } else if (b < 0xF0) {
                i += 3;
            } else if (b < 0xF8) {
                i += 4;
            } else if (b < 0xFC) {
                i += 5;
            } else {
                i += 6;
            }
        }
        return len;
    }
}
