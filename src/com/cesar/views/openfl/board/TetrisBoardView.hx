package com.cesar.views.openfl.board;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.shapes.BaseShape;
import flash.events.Event;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import msignal.Signal.Signal0;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import com.cesar.utils.constants.KeyBoardCodeConstants;
import com.cesar.utils.enums.GameState;
import com.cesar.utils.constants.SizeConstants;

/**
 * Represents the board game
 * @author Cesar Riva
 */
class TetrisBoardView extends Sprite
{
	private var currentGameState:GameState;
	private var arrowPressed:Bool = false;

	public var default_action_signal = new Signal0();
	public var rotate_action_signal = new Signal0();
	public var move_left_action_signal = new Signal0();
	public var move_right_action_signal = new Signal0();
	public var move_down_action_signal = new Signal0();
	
	private var blockSize:Int;
	private var columnQuantity:Int;
	private var rowQuantity:Int;
	
	private var gameOverLabel:TextField;
	
	private var errorLabel:TextField;
	var errorFormat:TextFormat = new TextFormat("_sans", 20, 0xFF0000, true);
	
	public function new() 
	{
		super();
	}
	
	/**
	 * Initialize the board, drawing a empty grid, setting the
	 * game state and adding some event listeners
	 */
	public function Initialize():Void
	{
		setSizeVariables();
		createGrid();
		setGameState(GameState.Paused);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		this.addEventListener(Event.ENTER_FRAME, everyFrame);
	}
	
	/**
	 * Update the gris with the current state of the game model
	 * @param	tetrisBoard - Represents all the data that is displayed
	 * in the grid
	 */
	public function UpdateBoardState(tetrisBoard:TetrisBoardModel):Void
	{
		cleanBoard();
		createGrid();
		paintBoardWithUpdatedModel(tetrisBoard);
		arrowPressed = false;
	}
	
	/**
	 * Finish the game, removing all threads for the event listeners
	 */
	public function FinishTheGame()
	{
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		this.removeEventListener(Event.ENTER_FRAME, everyFrame);
		showGameOverLabel();
	}
	
	public function showErrorMessage(errorMsg:String):Void
	{
		errorLabel = new TextField();
		errorLabel.text = errorMsg;
		errorLabel.defaultTextFormat = errorFormat;
		errorLabel.width = 600;
		errorLabel.height = 300;
		errorLabel.y = 600;
		addChild(errorLabel);
	}
	
	private function showGameOverLabel():Void
	{
		var format:TextFormat = new TextFormat("_sans", 20, 0xbbbbbb, true);
		format.align = TextFormatAlign.CENTER;
		
		gameOverLabel = new TextField();
		gameOverLabel.selectable = false;
		gameOverLabel.text = "GAME OVER!!!!";
		gameOverLabel.defaultTextFormat = format;
		gameOverLabel.x = 130;
		gameOverLabel.y = 280;
		addChild(gameOverLabel);
	}
	
	private function cleanBoard():Void
	{
		graphics.clear();
	}
	
	private function paintBoardWithUpdatedModel(tetrisBoard:TetrisBoardModel):Void
	{
		var currentShape = tetrisBoard.get_CurrentShape();
		if (currentShape != null)
		{
			drawShape(currentShape);
		}
		
		drawLandedShapesBasedOnTheBoard(tetrisBoard);
	}
	
	private function drawShape(shape:BaseShape):Void
	{
		graphics.beginFill(0xB22222);
		
		for (i in 0...shape.Blocks.length) 
		{
			var xP = shape.Blocks[i].XPosition;
			var yP = shape.Blocks[i].YPosition;
				
			graphics.drawRect((xP * blockSize), (yP * blockSize), blockSize, blockSize);
		}
		graphics.endFill();
	}
	
	private function drawLandedShapesBasedOnTheBoard(tetrisBoard:TetrisBoardModel):Void
	{
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
	
	/**
	 * Handle the keyboard event, redirecting the user input
	 * to the correct path
	 * @param	e
	 */
	private function handleArrowsKeyBoard(e:KeyboardEvent):Void
	{
		if (e.keyCode == KeyBoardCodeConstants.ARROW_UP_CODE)
		{
			trace("frame up\n");
			arrowPressed = true;
			rotate_action_signal.dispatch();
		}
		else if (e.keyCode == KeyBoardCodeConstants.ARROW_RIGHT_CODE)
		{
			trace("frame right\n");
			arrowPressed = true;
			move_right_action_signal.dispatch();
		}
		else if (e.keyCode == KeyBoardCodeConstants.ARROW_DOWN_CODE)
		{
			trace("frame down\n");
			arrowPressed = true;
			move_down_action_signal.dispatch();
		}
		else if (e.keyCode == KeyBoardCodeConstants.ARROW_LEFT_CODE)
		{
			trace("frame left\n");
			arrowPressed = true;
			move_left_action_signal.dispatch();
		}
	}
	
	/**
	 * Called every frame to dispatch the default action in the
	 * game, to make the shapes down one unit
	 * @param	event
	 */
	private function everyFrame(event:Event):Void
	{
		if (currentGameState == GameState.Playing && !arrowPressed)
		{
			trace("frame padrão\n");
			default_action_signal.dispatch();
		}
	}
}