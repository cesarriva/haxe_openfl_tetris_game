package com.cesar.models.business.gameRules;
import com.cesar.models.shapes.BaseShape;

/**
 * ...
 * @author Cesar Riva
 */
class RowFillerChecker implements IRowFillerChecker
{
	public function new() { }
	
	/**
	 * Returns a array with Y values from the blocks that
	 * assemble a shape
	 * @param	shape
	 * @return
	 */
	public function getYCoordinatesForTheShape(shape:BaseShape):Array<Int> 
	{
		var yCoordinates:Array<Int> = new Array<Int>();
		
		for (i in 0...shape.Blocks.length)
		{
			if (!Lambda.has(yCoordinates, shape.Blocks[i].YPosition))
			{
				yCoordinates.push(shape.Blocks[i].YPosition);
			}
		}
		
		return yCoordinates;
	}
	
	/**
	 * Handle all calculations to dump a row if it is completely filled
	 * @param	yCoordinates
	 * @param	board
	 */
	public function handleRowFillAndUpdateBoard(yCoordinates:Array<Int>, board:Array<Array<Bool>>):Void
	{
		for (row in yCoordinates)
		{
			if (rowIsCompletelyFilled(row, board))
			{
				dumpRow(row, board);
				rearrangeBoard(row, board);
			}
		}
	}
	
	/**
	 * Given a rowNumber, iterates through the bidimentional board
	 * and check if the row is completely filled with Trues
	 * @param	rowNumber
	 * @return Returns true if the row is completely filled, otherwise, returns false
	 */
	private function rowIsCompletelyFilled(rowNumber:Int, board:Array<Array<Bool>>):Bool
	{
		var isFilled:Bool = true;
		
		for (i in 0...board.length) 
		{
			if (!board[i][rowNumber])
			{
				isFilled = false;
				break;
			}
		}
		return isFilled;
	}
	
	/**
	 * Result all columns of a specific row to False
	 * @param	rowNumber
	 * @param	board
	 */
	private function dumpRow(rowNumber:Int, board:Array<Array<Bool>>):Void
	{
		for (i in 0...board.length) 
		{
			board[i][rowNumber] = false;
		}
	}
	
	/**
	 * Rearrange all values of the board after a row is cleared,
	 * taking the values from the row above and updating the row bellow
	 * @param	rowNumber
	 * @param	board
	 */
	private function rearrangeBoard(rowNumber:Int, board:Array<Array<Bool>>)
	{
		while (rowNumber > 0)
		{
			var aboveRow:Int = (rowNumber - 1);
			for (i in 0...board.length)
			{
				board[i][rowNumber] = board[i][aboveRow];
			}
			
			rowNumber--;
		}
	}
}