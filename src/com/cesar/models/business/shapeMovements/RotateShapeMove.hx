package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;
import com.cesar.models.shapes.enums.RotationStatus;

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
	 * Don't need to check board limits, because it's just a rotation
	 * @param	shape
	 * @return
	 */
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		return false;
	}
}