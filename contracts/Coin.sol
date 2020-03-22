pragma solidity >=0.4.17 <0.6.0;
contract Coin {

    address public minter;
    mapping (address => uint) public balances;


    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if (msg.sender != minter)
          revert();
        balances[receiver] += amount;
    }

    function transfer(address receiver, uint amount) public {
        if (balances[msg.sender] < amount)
          revert();
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
