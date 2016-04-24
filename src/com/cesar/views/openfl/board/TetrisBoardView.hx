package com.cesar.views.openfl.board;

import com.cesar.models.board.TetrisBoardModel;
import flash.events.Event;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import msignal.Signal.Signal0;

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

	public var default_action_signal = new Signal0();
	public var rotate_action_signal = new Signal0();
	public var move_left_action_signal = new Signal0();
	public var move_right_action_signal = new Signal0();
	public var move_down_action_signal = new Signal0();
	
	private var blockSize:Int;
	private var columnQuantity:Int;
	private var rowQuantity:Int;
		
	public function new() 
	{
		super();
	}
	
	public function Initialize():Void
	{
		setSizeVariables();
		createGrid();
		setGameState(GameState.Paused);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		this.addEventListener(Event.ENTER_FRAME, everyFrame);
	}
	
	public function UpdateBoardState(tetrisBoard:TetrisBoardModel):Void
	{
		cleanBoard();
		paintBoardWithUpdatedModel(tetrisBoard);
	}
	
	private function cleanBoard():Void
	{
		graphics.beginFill(0xFFFFFF);
		
		for (i in 0...columnQuantity)
		{
			for (j in 0...rowQuantity)
			{
				graphics.drawRect(((i * blockSize)), ((j * blockSize)), (blockSize), (blockSize));
			}
		}
		
		graphics.endFill();
	}
	
	private function paintBoardWithUpdatedModel(tetrisBoard:TetrisBoardModel):Void
	{
		var currentShape = tetrisBoard.get_CurrentShape();
		if (currentShape != null)
		{
			graphics.beginFill(0xB22222);
			for (i in 0...currentShape.Blocks.length) 
			{
				var xP = currentShape.Blocks[i].XPosition;
				var yP = currentShape.Blocks[i].YPosition;
				
				graphics.drawRect((xP * blockSize), (yP * blockSize), blockSize, blockSize);
			}
			graphics.endFill();
		}
		
		var actualBoard = tetrisBoard.get_Board();
		
		graphics.beginFill(0xB22222);
		for (i in 0...actualBoard.length) 
		{
			for (j in 0...actualBoard[i].length) 
			{
				if (actualBoard[i][j])
				{
					graphics.drawRect((i * blockSize), (j * blockSize), blockSize, blockSize);
				}
			}
		}
		graphics.endFill();
		
	}
	
	private function setSizeVariables():Void
	{
		blockSize = SizeConstants.BLOCK_SIZE;
		columnQuantity = cast((SizeConstants.BOARD_WIDTH  / blockSize), Int);
		rowQuantity = cast((SizeConstants.BOARD_HEIGHT / blockSize), Int);
	}
	
	/**
	 * Creates a grid board 10 columns x 18 rows
	 */
	private function createGrid():Void
	{
		graphics.lineStyle(1, 0x000000);
		
		for (i in 0...columnQuantity + 1)
		{
			for (j in 0...rowQuantity + 1)
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
	
	private function startGame():Void
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
				trace("frame up\n");
				arrowUpPressed = false;
				rotate_action_signal.dispatch();
			}
			else if (arrowRightPressed)
			{
				trace("frame right\n");
				arrowRightPressed = false;
				move_right_action_signal.dispatch();
			}
			else if (arrowDownPressed)
			{
				trace("frame down\n");
				arrowDownPressed = false;
				move_down_action_signal.dispatch();
			}
			else if (arrowLeftPressed)
			{
				trace("frame left\n");
				arrowLeftPressed = false;
				move_left_action_signal.dispatch();
			}
			else
			{
				default_action_signal.dispatch();
				trace("frame padrão\n");
			}
		}
	}

	/**
	 * Creates a full tile board 10 columns x 18 rows (NOT USED FOR NOW)
	 */
	//private function createEmptyTetrisBoard():Void
	//{
		//var blockSize:Int = SizeConstants.BLOCK_SIZE;
		//var columnQuantity:Int = cast((SizeConstants.BOARD_WIDTH  / blockSize), Int);
		//var rowQuantity:Int = cast((SizeConstants.BOARD_HEIGHT / blockSize), Int);
		
		//graphics.beginFill(0);
		
		//for (i in 0...columnQuantity)
		//{
			//for (j in 0...rowQuantity)
			//{
				//graphics.drawRect(((i * blockSize)), ((j * blockSize)), blockSize, blockSize);
			//}
		//}
		
		//graphics.endFill();
	//}
}