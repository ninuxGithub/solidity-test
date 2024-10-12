//SPDX-License-Idenfifier: MIT

pragma solidity ^0.8.26;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./Utils.sol";

contract HelloWorld is Utils {
    string public greeting = "Hello World ! ~~";

    function increase(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    uint256 public number = 0;

    function increase2(uint256 a, uint256 b) public view returns (uint256) {
        return a + b + number;
    }

    function increase3(uint256 a, uint256 b)
        public
        pure
        returns (uint256, uint256)
    {
        return (a, b);
    }

    uint256[] x;

    event Log(uint256 number, string message);

    function f(uint256[] memory array) public {
        x = array;

        for (uint256 i = 0; i < x.length; i++) {
            string memory result = Utils.uintToString(i);
            string memory message = string(
                abi.encodePacked("element index is :", result)
            );
            emit Log(x[i], message);
        }
    }

    function concatString() public pure returns (string memory) {
        uint256 num = 25;
        string memory str = "Hello Solidity";
        // string.concat(str, num)
        return string(abi.encodePacked(str, num));
    }

    uint256 uintVar = 256;
    int256 intVar = -25;
    bool flag = true;
    address myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes8 b8Var = "111";
    bytes32 b32Var = "hello solidity";
    string greetMessage = "hello solidity";
}
