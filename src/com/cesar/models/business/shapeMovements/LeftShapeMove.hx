package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;

/**
 * Handles when the shape moves left
 * @author Cesar Riva
 */
class LeftShapeMove implements IShapeMove
{
	public function new() { }
	
	/**
	 * Decrease X positions for all shape's blocks
	 * @param	shape
	 */
	public function move(shape:BaseShape):Void
	{
		for (i in 0...shape.Blocks.length) 
		{
			shape.Blocks[i].XPosition--;
		}
	}
	
	/**
	 * Check left board limits
	 * @param	shape
	 * @return
	 */
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		var shapeReachedLeftLimit:Bool = false;
		
		for (i in 0...shape.Blocks.length) 
		{
			if (shape.Blocks[i].XPosition < 0)
			{
				shapeReachedLeftLimit = true;
				break;
			}
		}
		
		return shapeReachedLeftLimit;
	}
}