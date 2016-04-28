package com.cesar.models.board;

import com.cesar.models.business.gameRules.ICheckGameOver;
import com.cesar.models.business.gameRules.IRowFillerChecker;
import com.cesar.models.shapes.BaseShape;
import com.cesar.models.signals.GameOverSignal;
import com.cesar.models.signals.ShapeUpdatedSignal;
import com.cesar.utils.constants.SizeConstants;

/**
 * Represents the tetris board data
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class TetrisBoardModel
{
	//Properties********************
	/**
	 * Matrix 10x18, containing boolean values
	 */
	private var board:Array<Array<Bool>>;
	
	/**
	 * Stores all shapes that was already landed in the board
	 */
	private var landedShapes:Array<BaseShape>;
	
	/**
	 * Stores the current shape that is been played by the user
	 */
	private var currentShape:BaseShape;
	
	@inject public var checkGameOver:ICheckGameOver;
	
	@inject public var rowFillerChecker:IRowFillerChecker;
	
	//Signals************************
	/**
	 * Singal dispatched when this model is updated
	 */
	@inject public var updateBoardModelSignal:ShapeUpdatedSignal;
	
	/**
	 * Signal dispatched when the game is over
	 */
	@inject public var gameOverSignal:GameOverSignal;
	
	public function new() 
	{
		landedShapes = new Array<BaseShape>();
		initBoard();
	}
	
	public function get_LandedShapes():Array<BaseShape>
	{
		return landedShapes;
	}
	
	public function set_LandedShapes(value:Array<BaseShape>):Void
	{
		landedShapes = value;
	}
	
	public function get_CurrentShape():BaseShape
	{
		return currentShape;
	}
	
	public function set_CurrentShape(value:BaseShape):Void
	{
		currentShape = value;
		updateBoardModelSignal.dispatch(this);
	}
	
	public function get_Board():Array<Array<Bool>>
	{
		return board;
	}
	
	/**
	 * Calls to land a shape. Used when a shape reaches the bottom limit of
	 * the board or colide with another landed shape
	 */
	public function landShape():Void
	{
		//update the board with the new shape
		landedShapes.push(currentShape);
		landShapeInTheBoard(currentShape);
		
		//check row fill
		handleRowFill(currentShape);
		
		//check game over
		if (checkGameOver.actualShapeReachTheTop(currentShape))
		{
			gameOverSignal.dispatch();
		}
		else
		{
			//distatch signal to update the view
			updateBoardModelSignal.dispatch(this);
		}
	}
	
	private function handleRowFill(shape:BaseShape):Void
	{
		var yCoordinates:Array<Int> = rowFillerChecker.getYCoordinatesForTheShape(shape);
		rowFillerChecker.handleRowFillAndUpdateBoard(yCoordinates, board);
	}
	
	
	/**
	 * Update the matrix, setting true to its positions that already
	 * contains landed shapes
	 * @param	shape
	 */
	private function landShapeInTheBoard(shape:BaseShape):Void
	{
		for (block in shape.Blocks) 
		{
			board[block.XPosition][block.YPosition] = true;
		};
	}
	
	/**
	 * Init the matrix with falses
	 */
	private function initBoard():Void
	{
		board = new Array<Array<Bool>>();
		
		var blockSize:Int = SizeConstants.BLOCK_SIZE;
		var columnQuantity:Int = cast((SizeConstants.BOARD_WIDTH  / blockSize), Int);
		var rowQuantity:Int = cast((SizeConstants.BOARD_HEIGHT / blockSize), Int);
		
		for (i in 0...columnQuantity) 
		{
			var row = new Array<Bool>();
			for (j in 0...rowQuantity) 
			{
				row.push(false);
			}
			
			board.push(row);
		}
	}
}