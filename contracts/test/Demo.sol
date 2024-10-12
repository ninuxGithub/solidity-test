//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

contract Demo {
    struct Info {
        uint256 id;
        address addr;
    }

    mapping(uint256 => Info) infoMapping;

    function addInfo(uint256 _id) public {
        infoMapping[_id] = Info(_id, msg.sender);
    }

    function sayHello(uint256 _id) view  public returns (string memory) {
        if (infoMapping[_id].addr == address(0)) {
            return "hello solidity";
        }

        return "hello, address info";
    }

    
}
