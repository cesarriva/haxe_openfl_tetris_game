package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;
import com.cesar.utils.constants.SizeConstants;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class DefaultShapeMove implements IShapeMove
{
	public function new() { }
	
	public function move(shape:BaseShape)
	{
		for (i in 0...shape.Blocks.length) 
		{
			shape.Blocks[i].YPosition++;
		}
	}
	
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