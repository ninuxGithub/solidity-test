//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

import "./Status.sol";
import "./Console.sol";

contract EventTest {
    mapping(address => uint256) public balanceMapping;

    event transmitEvent(
        address indexed from,
        address indexed to,
        uint256 balance
    );

    //test parameter address
    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,50
    function transmit(
        address from,
        address to,
        uint256 amount
    ) external {
        balanceMapping[from] = 1000000;
        balanceMapping[from] -= amount;
        balanceMapping[to] += amount;
        emit transmitEvent(from, to, amount);
    }
}
