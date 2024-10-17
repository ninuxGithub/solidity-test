//SPDX-Lisence-Identifier: MIT

pragma solidity ^0.8.26;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    mapping(address => uint256) fundersToAmount;

    uint256 constant minNum_value = 100 * 10**18;

    AggregatorV3Interface internal dataFeed;

    uint256 constant target = 1000 * 10 * 18;

    address public owner;

    uint256 deploymentTime;
    uint256 lockTime;

    address erc20Addr;

    bool public getFundSuccess = false;

    constructor(uint256 _lockTime) {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        owner = msg.sender;
        deploymentTime = block.timestamp;
        lockTime = _lockTime;
    }

    function fund() external payable {
        require(convertEthToUSD(msg.value) >= minNum_value, "Send more ETH");
        require(
            block.timestamp < deploymentTime + lockTime,
            "window is closed"
        );

        fundersToAmount[msg.sender] = msg.value;
    }

    function getChainlinkDataFeedLatestAnswer() public view returns (int256) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return answer;
    }

    function convertEthToUSD(uint256 ethAmount)
        internal
        view
        returns (uint256)
    {
        uint256 ethPrice = uint256(getChainlinkDataFeedLatestAnswer());
        return (ethAmount * ethPrice) / (10**8);
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "the function can be called only by owner"
        );
        _;
    }

    modifier windowClosed() {
        require(
            block.timestamp >= deploymentTime + lockTime,
            "window is not closed"
        );
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function getFund() external windowClosed onlyOwner {
        require(
            convertEthToUSD(address(this).balance) >= target,
            "Target is not reached"
        );
        bool success;
        (success, ) = payable(msg.sender).call{value: address(this).balance}(
            ""
        );

        require(success, "transfer tx failed");
        fundersToAmount[msg.sender] = 0;
        getFundSuccess = true;
    }

    function reFund() external windowClosed {
        require(
            convertEthToUSD(address(this).balance) < target,
            "Target is Reached"
        );
        require(fundersToAmount[msg.sender] != 0, "there is no fund for you");

        bool success;
        (success, ) = payable(msg.sender).call{
            value: fundersToAmount[msg.sender]
        }("");

        require(success, "transfer tx failed");
        fundersToAmount[msg.sender] = 0;
    }

    function setErc20Addr(address _erc20Addr) public onlyOwner {
        erc20Addr = _erc20Addr;
    }
}
