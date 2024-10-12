//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

contract Console {
   

    event Log(address indexed sender, string message);
    
    function log() public{
        emit Log(msg.sender, "this case is for test log");
    }
    
}
