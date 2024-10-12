//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

import {Person} from "./Person.sol";

contract PersonFactory {
    //维护一个数组来保存创建的person
    Person[] public personArr;

    function createPerson() public {
        personArr.push(new Person());
    }

    //调用person合约里面的方法
    function invokeMethod(uint256 _index, string memory _message)
        public
        view
        returns (string memory)
    {
        return personArr[_index].sayHello(_message);
    }
}
