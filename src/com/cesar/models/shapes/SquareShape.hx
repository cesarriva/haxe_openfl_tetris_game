package com.cesar.models.shapes;

import com.cesar.models.shapes.enums.RotationStatus;
import com.cesar.models.shapes.rotation.IRotationShape;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class SquareShape extends BaseShape
{
	public function new(x:Int, y:Int, rotation:IRotationShape) 
	{
		super(rotation);
		
		//if(CurrentRotationStatus == RotationStatus.Full)
		//{
			setDefaultShapePosition(x, y);
		//}
		//rotation.setHalfRotation
	}
	
	
	public override function setDefaultShapePosition(x:Int, y:Int):Void
	{
		Blocks.set(0, new Block(x, y));
		Blocks.set(1, new Block((x + 1), y));
		Blocks.set(2, new Block(x, (y + 1)));
		Blocks.set(3, new Block((x + 1), (y + 1)));
	}
}