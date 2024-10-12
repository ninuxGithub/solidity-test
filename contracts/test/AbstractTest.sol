//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

abstract contract AbstractTest {
    function sayHello() public pure virtual returns (string memory);
}

contract AbstractImpl is AbstractTest {
    function sayHello() public pure  virtual override returns (string memory) {
        return "this is child override method";
    }
}
