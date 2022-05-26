//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
//pragma experimental ABIEncoderV2;

contract EdublocksToken {
    string  public name = "Edublocks Token";
    string  public symbol = "EDBX";
    string  public standard = "Edublocks Token v1.0";
    uint256 public totalSupply;
    
    
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor (uint256 _initialSupply)  {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
    function deduct(address student, uint256 _value) public returns (bool success){
        balanceOf[student] -= _value;
        return true;
    }
    function getBalance(address tokenOwner) public view returns (uint) {
        return balanceOf[tokenOwner];
    }
    
    function getAllowance(address owner, address delegate) public view returns (uint) {
        return allowance[owner][delegate];
    }
}
