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
		var formatText:TextFormat = new TextFormat("_sans", 16, 0xbbbbbb, true);
		formatText.align = TextFormatAlign.CENTER;
		
		startGameMessage = new TextField();
		startGameMessage.x = (SizeConstants.BOARD_WIDTH + 20);
		startGameMessage.y = SizeConstants.BOARD_INITIAL_Y_POSITION;
		startGameMessage.width = 320;
		startGameMessage.height = 300;
		startGameMessage.defaultTextFormat = formatText;
		startGameMessage.selectable = false;
		startGameMessage.text = "CLICK on the screen and PRESS SPACE to start\n\nUp arrow - Rotate clockwise\nRight arrow - Move right\nDown arrow - Down one unit\nLeft arrow - Move left";
		addChild(startGameMessage);
	}
}