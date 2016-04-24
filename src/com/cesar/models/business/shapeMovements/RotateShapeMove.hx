package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;

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
		
	}
	
	public function shapeReachedBoardLimits(shape:BaseShape):Bool
	{
		return false;
	}
}