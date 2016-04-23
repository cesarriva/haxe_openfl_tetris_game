package com.cesar.models.board;

import com.cesar.models.shapes.BaseShape;
import com.cesar.models.signals.ShapeUpdatedSignal;
import com.cesar.utils.constants.SizeConstants;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class TetrisBoardModel
{
	private var board:Array<Array<Bool>>;
	private var landedShapes:Array<BaseShape>;
	private var currentShape:BaseShape;
	
	@inject public var shapeUpdateSignal:ShapeUpdatedSignal;
	
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
	
	public function downShapeByOneUnit()
	{
		for (i in 0...currentShape.Blocks.length) 
		{
			currentShape.Blocks[i].YPosition++;
		}
		shapeUpdateSignal.dispatch(this);
	}
	
	public function landShape():Void
	{
		landedShapes.push(currentShape);
		landShapeInTheBoard(currentShape);
	}
	
	private function landShapeInTheBoard(shape:BaseShape):Void
	{
		for (block in shape.Blocks) 
		{
			board[block.XPosition][block.YPosition] = true;
		};
	}
	
	/**
	 * Does the board initialization, filling all board cells
	 * with false, meaning the the board is empty and doesn't have
	 * any shape on it
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