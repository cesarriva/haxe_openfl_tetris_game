package com.cesar.views.openfl.board;

import flash.events.Event;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;

import com.cesar.utils.constants.KeyBoardCodeConstants;
import com.cesar.utils.enums.GameState;
import com.cesar.utils.constants.SizeConstants;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class TetrisBoardView extends Sprite
{
	private var currentGameState:GameState;
	
	private var arrowUpPressed:Bool = false;
	private var arrowDownPressed:Bool = false;
	private var arrowLeftPressed:Bool = false;
	private var arrowRightPressed:Bool = false;

	public function new() 
	{
		super();
	}
	
	public function Initialize():Void
	{
		createGrid();
		setGameState(GameState.Paused);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		this.addEventListener(Event.ENTER_FRAME, everyFrame);
	}
	
	/**
	 * Creates a full tile board 10 columns x 18 rows
	 */
	private function createEmptyTetrisBoard():Void
	{
		var blockSize:Int = SizeConstants.BLOCK_SIZE;
		var columnQuantity:Int = cast((SizeConstants.BOARD_WIDTH  / blockSize), Int);
		var rowQuantity:Int = cast((SizeConstants.BOARD_HEIGHT / blockSize), Int);
		
		graphics.beginFill(0);
		
		for (i in 0...columnQuantity)
		{
			for (j in 0...rowQuantity)
			{
				graphics.drawRect(((i * blockSize)), ((j * blockSize)), blockSize, blockSize);
			}
		}
		
		graphics.endFill();
	}
	
	/**
	 * Creates a grid board 10 columns x 18 rows
	 */
	private function createGrid():Void
	{
		var blockSize:Int = SizeConstants.BLOCK_SIZE;
		var columnQuantity:Int = cast((SizeConstants.BOARD_WIDTH  / blockSize), Int);
		var rowQuantity:Int = cast((SizeConstants.BOARD_HEIGHT / blockSize), Int);
		
		graphics.lineStyle(1, 0x000000);
		
		for (i in 0...columnQuantity+1)
		{
			for (j in 0...rowQuantity+1)
			{
				graphics.moveTo((i * blockSize), 0);
				graphics.lineTo((i * blockSize), (rowQuantity * blockSize));
				graphics.moveTo(0, (j * blockSize));
				graphics.lineTo((blockSize * columnQuantity), (blockSize * j));
			}
		}
		
		graphics.endFill();
	}
	
	private function setGameState(state:GameState):Void
	{
		currentGameState = state;
	}
	
	private function onKeyDownHandler(e:KeyboardEvent):Void
	{
		if (currentGameState == GameState.Paused && e.keyCode == KeyBoardCodeConstants.SPACEBAR_CODE)
		{
			startGame();
		}
		else if (currentGameState == GameState.Playing)
		{
			handleArrowsKeyBoard(e);
		}
	}
	
	private function startGame()
	{
		setGameState(GameState.Playing);
	}
	
	private function handleArrowsKeyBoard(e:KeyboardEvent):Void
	{
		if (e.keyCode == KeyBoardCodeConstants.ARROW_UP_CODE)
		{
			arrowUpPressed = true;
		}
		else if (e.keyCode == KeyBoardCodeConstants.ARROW_RIGHT_CODE)
		{
			arrowRightPressed = true;
		}
		else if (e.keyCode == KeyBoardCodeConstants.ARROW_DOWN_CODE)
		{
			arrowDownPressed = true;
		}
		else if (e.keyCode == KeyBoardCodeConstants.ARROW_LEFT_CODE)
		{
			arrowLeftPressed = true;
		}
	}
	
	private function everyFrame(event:Event):Void
	{
		if (currentGameState == GameState.Playing)
		{
			if (arrowUpPressed)
			{
				arrowUpPressed = false;
				trace("frame up\n");
				//trigger rotate signal
			}
			else if (arrowRightPressed)
			{
				arrowRightPressed = false;
				trace("frame right\n");
				//trigger right move signal
			}
			else if (arrowDownPressed)
			{
				arrowDownPressed = false;
				trace("frame down\n");
				//trigger down move signal
			}
			else if (arrowLeftPressed)
			{
				arrowLeftPressed = false;
				trace("frame left\n");
				//trigger left move signal
			}
			else
			{
				trace("frame padrão\n");
			}
		}
	}
}