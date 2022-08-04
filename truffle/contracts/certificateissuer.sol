// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14 ; 

import "./ownable.sol"; 
contract CertificateIssuer is Ownable{
    // only admin can set who can recive the certificates 
    constructor (){
        _admin = msg.sender ; 
    }
    
    

    //  function to change admin 
    function setAdmin(address _adminParameter) public onlyOwner{
        _admin = _adminParameter ; 
    }

    // the recipients will be identified by only a unique ID 
    mapping(string => bool) cauthValid ; 
    mapping(string => bool) cauthToCanStake; 
    mapping(string => address payable) cauthToAddress; 

    address internal _admin;
    
    mapping(address => string) internal adressToCauth ; 
    mapping(address =>  uint) public stakedAmount ;     
    

    event certificateIssued(string  _name , string  _courseTittle, uint _duration , string institute,string  cauth) ; 
    event stakeReturned(address _studentAddress,uint _amount) ; 

    
   // struct Certificate {
        //>name , nationality , NID , institute 
    //     string storage name ; 
    // }
    
    // mapping(uint => string) idtoInstituteName // can be used to save storge space by uint32 packing
    // initiate mapping values in constructor 
    // have a fucntion with only owner modifier to update this list of institutes 



    // inside struct have name -- NOTE HAVING STRUCTS WILL END UP BEING MORE EXPENSIVE  

    // have an dynamic array of certificate structs 

    //  have a external payable function { mayb with authenticator modifier which allows only the owner to call it ; owner = my backend with the key of the deployer / as of now } 
    //  named issueCertificate -- TRYING ISSUE CERTIFICATE WITH ONLY USING TRXN DATA TO SAVE TO STORAGE 
    //  emit and event to generate the first certificate PDF 
    // ADDS A CAUTH VALUE - THIS CAUTH VALUE CAN THEN BE LATER USED TO get a certificate 
    function updateCertificateRecipient(string memory cauth) public  {
        require(msg.sender == _admin) ;
        cauthValid[cauth] = true ;  
        require(cauthValid[cauth]) ; 
        cauthToCanStake[cauth] = true ; 
    }

    // overloaded function that enables staking functionality 
    // optional for the sutdent 
    // will be enabled if the student uses Web3 version of the MOOC 
    function updateCertificateRecipientForStaking(string memory cauth,address payable _staker ) public   {
        require(msg.sender == _admin) ;
        cauthValid[cauth] = true ;  
        require(cauthValid[cauth]) ; 
        cauthToCanStake[cauth] = true ; 
        adressToCauth[_staker] = cauth ;
        cauthToAddress[cauth] =_staker ;
    }

    function issueCertificate(string memory _name , string memory _courseTittle, uint _duration , string memory institute,string memory cauth ) external payable  {
          
        //check for admin 
        require(msg.sender == _admin) ;
        
        // adding cauth to the list 
        require(cauthValid[cauth] == true) ;

        // emit event 
        emit certificateIssued(_name,_courseTittle,_duration,institute,cauth) ; 
        
        // interactions 

        if(cauthToCanStake[cauth]){
    
            (cauthToAddress[cauth]).transfer(stakedAmount[cauthToAddress[cauth]]);
            emit stakeReturned(cauthToAddress[cauth],stakedAmount[cauthToAddress[cauth]]) ;
            cauthToCanStake[cauth] = false ; 
        }
        cauthValid[cauth] = false ; 

    }

    modifier onlyAdmin{
        require(msg.sender == _admin);
        _;
    }

    
    
    receive () external payable{
        require(cauthToCanStake[adressToCauth[msg.sender]])  ;
        stakedAmount[msg.sender] = msg.value; 
    }
}
// contract Staking is CertificateIssuer {
//     mapping(address =>  uint) public stakedAmount ;     
    
//     receive () external payable{
//         require(cauthToCanStake[adressToCauth[msg.sender]])  ;
//         stakedAmount[msg.sender] = msg.value; 
//     }








