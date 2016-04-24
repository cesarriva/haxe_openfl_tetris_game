package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class LeftShapeMove implements IShapeMove
{
	public function new() { }
	
	public function move(shape:BaseShape):Void
	{
		for (i in 0...shape.Blocks.length) 
		{
			shape.Blocks[i].XPosition--;
		}
	}
	
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		var shapeReachedLeftLimit:Bool = false;
		
		for (i in 0...shape.Blocks.length) 
		{
			if (shape.Blocks[i].XPosition <= 0)
			{
				shapeReachedLeftLimit = true;
				break;
			}
		}
		
		return shapeReachedLeftLimit;
	}
}