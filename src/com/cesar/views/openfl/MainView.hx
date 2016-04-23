package com.cesar.views.openfl;

import com.cesar.utils.constants.SizeConstants;
import com.cesar.views.openfl.board.TetrisBoardView;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class MainView extends Sprite
{
	private var startGameMessage:TextField;
	private var instructionMessage:TextField;
		
	public function new() 
	{
		super();		
	}
	
	public function Initialize():Void
	{
		var tetrisBoard:TetrisBoardView = new TetrisBoardView();
		tetrisBoard.x = SizeConstants.BOARD_INITIAL_X_POSITION;
		tetrisBoard.y = SizeConstants.BOARD_INITIAL_Y_POSITION;
		addChild(tetrisBoard);
		
		setInstructionGameText();
	}
	
	private function setInstructionGameText()
	{
		var gameMessageFormatText:TextFormat = new TextFormat("_sans", 16, 0xbbbbbb, true);
		gameMessageFormatText.align = TextFormatAlign.CENTER;
		
		startGameMessage = new TextField();
		startGameMessage.x = (SizeConstants.BOARD_WIDTH + 20);
		startGameMessage.y = SizeConstants.BOARD_INITIAL_Y_POSITION;
		startGameMessage.width = 400;
		startGameMessage.height = 100;
		startGameMessage.defaultTextFormat = gameMessageFormatText;
		startGameMessage.selectable = false;
		startGameMessage.text = "CLICK on the screen and PRESS SPACE to START\n\n";
		addChild(startGameMessage);
		
		var instructionFormatText:TextFormat = new TextFormat("_sans", 16, 0xbbbbbb, true);
		instructionFormatText.align = TextFormatAlign.LEFT;
		
		instructionMessage = new TextField();
		instructionMessage.x = startGameMessage.x;
		instructionMessage.y = startGameMessage.y + 30;
		instructionMessage.width = 170;
		instructionMessage.height = 300;
		instructionMessage.defaultTextFormat = instructionFormatText;
		instructionMessage.selectable = false;
		instructionMessage.text = "▲ - Rotate clockwise\n► - Move right\n▼ - Down one unit\n◄ - Move left";
		addChild(instructionMessage);
	}
}