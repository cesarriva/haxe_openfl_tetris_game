package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;
import com.cesar.utils.constants.SizeConstants;

/**
 * Handles the default movement (down by one unit)
 * @author Cesar Riva
 */
class DefaultShapeMove implements IShapeMove
{
	public function new() { }
	
	/**
	 * * Increase Y positions for all shape's blocks
	 * @param	shape
	 */
	public function move(shape:BaseShape)
	{
		for (i in 0...shape.Blocks.length) 
		{
			shape.Blocks[i].YPosition++;
		}
	}
	
	/**
	 * Check the bottom limit
	 * @param	shape
	 * @return
	 */
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		var shapeReachedLimit:Bool = false;
		var maxHeight:Int = (cast((SizeConstants.BOARD_HEIGHT / SizeConstants.BLOCK_SIZE), Int));
		
		for (i in 0...shape.Blocks.length) 
		{
			if (shape.Blocks[i].YPosition >= maxHeight)
			{
				shapeReachedLimit = true;
				break;
			}
		}
		
		return shapeReachedLimit;
	}
}