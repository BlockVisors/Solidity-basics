pragma solidity ^0.4.18;

// REMEMBER TO TEST ON ROBSEN TEST NETWORK- SET REMIX TO INJECTED WEB3


// This is a sample contract to force you to HODL!!
// Altered from Coursetro
contract TimeCapsule {


  // we can adjust the time here
    address owner;
    uint256 public amount;
    uint public unLockTime = now + 2 years;   // Modify this
    // we are gonna HODL FOR 2 YEARS

   // this is the Constructor
    function TimeCapsule() payable public {
        owner = msg.sender;
        amount = msg.value;
    }

    modifier onlyOwnerAtTime {
        // WE REQUIRE WHOEVER WANT TO ACCESS THIS TO BE OWNER
        // WE REQUIRE UNLOCKED TIME IS WHAT WE SPECIFIED UP TOP
        require(msg.sender == owner && unLockTime < now);
        _;
    }

    function send() public onlyOwnerAtTime {
    // SELF-DESTRUCT
            selfdestruct(owner);
    }
}
