package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;
import com.cesar.models.shapes.enums.RotationStatus;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class RotateShapeMove implements IShapeMove
{
	public function new() { }
	
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
	
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		return false;
	}
}