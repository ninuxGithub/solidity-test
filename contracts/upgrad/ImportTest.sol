//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

// import {Arrays} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/4a9cc8b4918ef3736229a5cc5a310bdc17bf759f/contracts/utils/Arrays.sol";
import {Arrays} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Arrays.sol";

contract ImportTest {
    //找到数字所在的角标

    uint256[] uintArray = [1, 3, 5, 9, 10];

    function testMethod(uint256 num) public view returns (uint256) {
        return Arrays.findUpperBound(uintArray, num);
    }

    // function testSort() public returns (uint256[] memory) {
    //     uint256[] memory myArr = [1, 3, 5, 9, 10];
    //     uint256[] memory newArr = Arrays.sort(myArr);
    //     return newArr;
    // }


    
}
