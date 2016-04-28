package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;
import com.cesar.models.shapes.enums.RotationStatus;
import com.cesar.utils.constants.SizeConstants;

/**
 * Handles the rotation movement of each shape
 * @author Cesar Riva
 */
class RotateShapeMove implements IShapeMove
{
	public function new() { }
	
	/**
	 * Turns by 90 degree clockwise all the shapes, considering its actual
	 * state rotation
	 * @param	shape
	 */
	public function move(shape:BaseShape):Void
	{	
		if (shape.CurrentRotationStatus == RotationStatus.Full)
		{
			shape.rotationShape.setOneQuarterRotation(shape);
		}
		else if (shape.CurrentRotationStatus == RotationStatus.OneQuarter)
		{
			shape.rotationShape.setHalfRotation(shape);
		}
		else if (shape.CurrentRotationStatus == RotationStatus.Half)
		{
			shape.rotationShape.setThreeQuarterRotation(shape);
		}
		else if (shape.CurrentRotationStatus == RotationStatus.ThreeQuarters)
		{
			shape.rotationShape.setFullRotation(shape);
		}
	}
	
	/**
	 * Check all board limits, top, right, bottom, left
	 * @param	shape
	 * @return
	 */
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		var shapeReachedtLimit:Bool = false;
		
		var minWithHeight:Int = 0;
		var maxWidth:Int = (cast((SizeConstants.BOARD_WIDTH / SizeConstants.BLOCK_SIZE), Int));
		var maxHeight:Int = (cast((SizeConstants.BOARD_HEIGHT / SizeConstants.BLOCK_SIZE), Int));
		
		for (i in 0...shape.Blocks.length) 
		{
			if (shape.Blocks[i].XPosition >= maxWidth || shape.Blocks[i].XPosition < minWithHeight
				|| shape.Blocks[i].YPosition >= maxHeight || shape.Blocks[i].YPosition < 0)
			{
				shapeReachedtLimit = true;
				break;
			}
		}
		
		return shapeReachedtLimit;
	}
}