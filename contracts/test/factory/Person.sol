//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

contract Person {
    function sayHello(string calldata message)
        public
        pure
        returns (string memory)
    {
        return string.concat("hello! ", message);
    }
}
