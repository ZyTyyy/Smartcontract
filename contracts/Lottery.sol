// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLotto {
    address public owner;
    address[] public participants;
    uint public maxParticipants;
    uint public ticketPrice;
    uint public lotteryEndTime;

    event TicketPurchased(address indexed buyer);
    event WinnerChosen(address indexed winner, uint amount);

    constructor(uint _maxParticipants, uint _duration) {
        owner = msg.sender;
        maxParticipants = _maxParticipants;
        ticketPrice = 0.0001 ether; // Prix du ticket fixé à 0.0001 ETH
        lotteryEndTime = block.timestamp + _duration;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    modifier isOngoing() {
        require(block.timestamp < lotteryEndTime, "The lottery has ended.");
        require(participants.length < maxParticipants, "Maximum participants reached.");
        _;
    }

    function buyTicket() public payable isOngoing {
        require(msg.value == ticketPrice, "Incorrect ticket price.");
        participants.push(msg.sender);
        emit TicketPurchased(msg.sender);

        if (participants.length == maxParticipants) {
            pickWinner();
        }
    }

    function pickWinner() public {
        require(block.timestamp >= lotteryEndTime || participants.length == maxParticipants, "Lottery is still ongoing.");
        require(participants.length > 0, "No participants in the lottery.");

        uint randomIndex = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, participants))) % participants.length;
        address winner = participants[randomIndex];

        uint prize = address(this).balance;
        (bool success, ) = winner.call{value: prize}("");
        require(success, "Transfer to winner failed.");

        emit WinnerChosen(winner, prize);

        delete participants;
        lotteryEndTime = block.timestamp + (lotteryEndTime - block.timestamp);
    }

    function getParticipants() public view returns (address[] memory) {
        return participants;
    }

    function endLottery() public onlyOwner {
        lotteryEndTime = block.timestamp;
        if (participants.length > 0) {
            pickWinner();
        }
    }

    function jackpot() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
}
