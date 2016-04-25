package com.cesar.models.board;

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
	
	/**
	 * Singal dispatched when this model is updated
	 */
	@inject public var shapeUpdateSignal:ShapeUpdatedSignal;
	
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
		shapeUpdateSignal.dispatch(this);
	}
	
	public function get_Board():Array<Array<Bool>>
	{
		return board;
	}
	
	/**
	 * Calls to land a shape. Used when a shape reaches the limit of
	 * the board or colide with another landed shape
	 */
	public function landShape():Void
	{
		landedShapes.push(currentShape);
		landShapeInTheBoard(currentShape);
		
		checkRowFill();
		
		if (shapeReachTheBoard())
		{
			gameOverSignal.dispatch();
		}
	}
	
	/**
	 * Checks if the current landed shape
	 * reachs the top of the board
	 * @return
	 */
	private function shapeReachTheBoard():Bool
	{
		var reach:Bool = false;

		for (i in 0...currentShape.Blocks.length) 
		{
			if (currentShape.Blocks[i].YPosition == 0)
			{
				reach = true;
				break;
			}
		}
		return reach;
	}
	
	/**
	 * Called after the landed to check if there is any
	 * row totally filled, if yes, remove it and update
	 * all positions and shapes above
	 * TODO: this method is not working properly yet..take a look after
	 */
	private function checkRowFill():Void
	{
		var rowNumber:Int = -1;
		var rowsErased:Bool = false;
		
		for (i in 0...currentShape.Blocks.length) 
		{
			var yPos = currentShape.Blocks[i].YPosition;
			
			if (yPos != rowNumber)
			{
				rowNumber = yPos;
				rowsErased = mustEraseRow(rowNumber);
				if (rowsErased)
				{
					eraseRow(rowNumber);
				}
			}
		}
		
		if (rowsErased)
		{
			shapeUpdateSignal.dispatch(this);
		}
	}
	
	private function mustEraseRow(rowNumber:Int):Bool
	{
		var mustErase:Bool = true;
		
		for (i in 0...board.length) 
		{
			if (!board[i][rowNumber])
			{
				mustErase = false;
				break;
			}
		}
		
		return mustErase;
	}
	
	private function eraseRow(rowNumber:Int)
	{
		var controlRowUpdate:Int = rowNumber;
		for (i in 0...board.length) 
		{
			board[i][controlRowUpdate] = false;
			
			while (controlRowUpdate >= 0)
			{
				board[i][controlRowUpdate] = board[i][controlRowUpdate--];
			}
			controlRowUpdate = rowNumber;
		}
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