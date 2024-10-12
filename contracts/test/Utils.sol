//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

contract Utils {
    function uintToString(uint256 _i) public pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 length = 0;
        while (j > 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i > 0) {
            k--;
            uint8 temp = (48 + uint8(_i % 10));
            bstr[k] = bytes1(temp);
            _i /= 10;
        }
        return string(bstr);
    }
}
