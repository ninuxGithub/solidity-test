//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

import "./Status.sol";
import "./Console.sol";

contract EnumTest {
    Status public status = Status.Accepted;

    function getStatus() public view returns (Status) {
    
        return status;
    }
}
