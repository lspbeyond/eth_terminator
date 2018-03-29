pragma solidity ^0.4.18;

    /**
    * Example script for the Ethereum development 非诚勿扰 分歧终端机
    */

contract terminator {
	enum GAMETOOL { hammer, clipper, hanky}
	address public addrPlayer1;
	address public addrPlayer2;
	address public addrWinner;
	GAMETOOL toolPlayer1;

    /**
    * The logs that will be emitted in every step of the contract's life cycle
    */
	event GameDrawEvent();
	event GameOverEvent(address winner);

    /**
    * The contract constructor
    */
	function terminator() public {
		addrPlayer1 = address(0);
		addrPlayer2 = address(0);
		addrWinner = address(0);
	}

    /**
    * play the game 
    */
	function playGame(GAMETOOL chosen) public {
		if(addrPlayer1 == address(0)) 
		{
			addrPlayer1 = msg.sender;
			toolPlayer1 = chosen;
		}
		else if(addrPlayer2 == address(0))
		{
			addrPlayer2 = msg.sender;
			int chosen1 = int(toolPlayer1);
			int chosen2 = int(chosen);
			if(toolPlayer1==chosen)
			{
				//draw, reset the game
				addrPlayer1 = address(0);
				addrPlayer2 = address(0);
				GameDrawEvent();
			}
			//else if(toolPlayer1-chosen==-1 || toolPlayer1-chosen==2)
			else if(chosen1-chosen2==-1 || chosen1-chosen2==2)
			{
				addrWinner = addrPlayer1;
				GameOverEvent(addrWinner);
			}
			else
			{
				addrWinner = addrPlayer2;
				GameOverEvent(addrWinner);
			}
		}

    }

}