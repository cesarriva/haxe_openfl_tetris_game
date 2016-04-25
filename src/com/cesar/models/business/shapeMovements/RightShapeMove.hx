package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;
import com.cesar.utils.constants.SizeConstants;

/**
 * Handles when the shape moves right
 * @author Cesar Riva
 */
class RightShapeMove implements IShapeMove
{
	public function new() { }
	
	/**
	 * * Increase X positions for all shape's blocks
	 * @param	shape
	 */
	public function move(shape:BaseShape):Void
	{
		for (i in 0...shape.Blocks.length) 
		{
			shape.Blocks[i].XPosition++;
		}
	}
	
	/**
	 * Check right board limits
	 * @param	shape
	 * @return
	 */
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		var shapeReachedRightLimit:Bool = false;
		var maxWidth:Int = (cast((SizeConstants.BOARD_WIDTH / SizeConstants.BLOCK_SIZE), Int));
		
		for (i in 0...shape.Blocks.length) 
		{
			if (shape.Blocks[i].XPosition >= maxWidth)
			{
				shapeReachedRightLimit = true;
				break;
			}
		}
		
		return shapeReachedRightLimit;
	}
}