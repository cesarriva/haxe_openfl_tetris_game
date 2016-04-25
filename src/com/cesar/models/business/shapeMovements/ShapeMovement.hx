package com.cesar.models.business.shapeMovements;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.business.factories.ShapeFactory;
import com.cesar.models.shapes.BaseShape;
import com.cesar.models.shapes.Block;
import haxe.ds.Vector;

/**
 * Class responsible to execute the shape movement
 * @author Cesar Riva
 */
class ShapeMovement
{
	private var boardModel:TetrisBoardModel;
	private var iShapeMove:IShapeMove;

	/**
	 * Constructor
	 * @param	iShapeMove - used to inject the correct type of movement depending on the shape
	 * @param	tetrisBoardModel
	 */
	public function new(iShapeMove:IShapeMove, tetrisBoardModel:TetrisBoardModel)
	{
		this.iShapeMove = iShapeMove;
		boardModel = tetrisBoardModel;
	}
	
	/**
	 * Handles the shape movement, checking the board limits, checking if the shape can keep going
	 * or must be landed
	 */
	public function moveShape():Void 
	{	
		var currentShape = boardModel.get_CurrentShape();
		var actualShapePositions = getShapeActualPosition(currentShape);
		
		iShapeMove.move(currentShape);
		
		if (!iShapeMove.shapeReachedBoardLimits(currentShape) && !shapeCollided(currentShape))
		{
			boardModel.set_CurrentShape(currentShape);
		}
		else
		{
			//restore to the last valid position
			restoreShapePosition(currentShape, actualShapePositions);
			
			//The shape is falling, so must be landed
			if (Std.is(iShapeMove, DefaultShapeMove))
			{
				boardModel.landShape();
				boardModel.set_CurrentShape(null);
			}
			else
			{
				//otherwise, don't do anything
				boardModel.set_CurrentShape(boardModel.get_CurrentShape());
			}
		}
	}
	
	/**
	 * Check shape colision using the matrix to find
	 * other shapes already landed
	 * @param	shape
	 * @return Returns true case the shape colided
	 */
	public function shapeCollided(shape:BaseShape):Bool
	{
		var collided:Bool = false;
		var boardPosition = boardModel.get_Board();
		
		for (i in 0...shape.Blocks.length) 
		{
			var blockXPos = shape.Blocks[i].XPosition;
			var blockYPos = shape.Blocks[i].YPosition;
			
			var blockPositionIsFilled:Bool = boardPosition[blockXPos][blockYPos];
			
			if (blockPositionIsFilled)
			{
				collided = true;
				break;
			}
		}
		
		return collided;
	}
	
	/**
	 * Returns all block shapes, with its positions in the board
	 * @param	shape
	 * @return
	 */
	private function getShapeActualPosition(shape:BaseShape):Vector<Block>
	{
		var blocks:Vector<Block> = new Vector<Block>(4);
		
		for (i in 0...shape.Blocks.length) 
		{
			var block = new Block(shape.Blocks[i].XPosition, shape.Blocks[i].YPosition);
			blocks.set(i, block);
		}
		
		return blocks;
	}
	
	/**
	 * Restore all block shape positions, used when the shape board limits and colision validation
	 * fails
	 * @param	currentShape
	 * @param	blocks
	 */
	private function restoreShapePosition(currentShape:BaseShape, blocks:Vector<Block>)
	{
		for (i in 0...blocks.length) 
		{
			currentShape.Blocks[i].XPosition = blocks[i].XPosition;
			currentShape.Blocks[i].YPosition = blocks[i].YPosition;
		}
	}
}