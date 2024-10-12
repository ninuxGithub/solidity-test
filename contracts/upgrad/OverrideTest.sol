//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

contract OverrideTest {
    function saySomeThing() public pure returns (string memory) {
        return "Nothing";
    }

    function saySomeThing(string memory message)
        public
        pure
        returns (string memory)
    {
        return message;
    }
}
