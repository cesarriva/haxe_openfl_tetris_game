package com.cesar.models.shapes.rotation;

import com.cesar.models.shapes.enums.RotationStatus;

/**
 * ...
 * @author Cesar Riva
 */
class LRotation implements IRotationShape
{

	public function new() 
	{
		
	}
	
	public function setOneQuarterRotation(shape:BaseShape):Void 
	{
		var currentX = shape.Blocks[0].XPosition;
		var currentY = shape.Blocks[0].YPosition;
		
		shape.CurrentRotationStatus = RotationStatus.OneQuarter;
		
		shape.Blocks.set(0, new Block((currentX + 2), currentY));
		shape.Blocks.set(1, new Block(currentX + 1, currentY));
		shape.Blocks.set(2, new Block(currentX, currentY));
		shape.Blocks.set(3, new Block(currentX, (currentY + 1)));
	}
	
	public function setHalfRotation(shape:BaseShape):Void 
	{
		var currentX = shape.Blocks[0].XPosition;
		var currentY = shape.Blocks[0].YPosition;
		
		shape.CurrentRotationStatus = RotationStatus.Half;
		
		shape.Blocks.set(0, new Block((currentX - 1), (currentY + 2)));
		shape.Blocks.set(1, new Block((currentX - 1), (currentY + 1)));
		shape.Blocks.set(2, new Block((currentX - 1), currentY));
		shape.Blocks.set(3, new Block((currentX - 2), currentY));
	}
	
	public function setThreeQuarterRotation(shape:BaseShape):Void 
	{
		var currentX = shape.Blocks[0].XPosition;
		var currentY = shape.Blocks[0].YPosition;
		
		shape.CurrentRotationStatus = RotationStatus.ThreeQuarters;
		
		shape.Blocks.set(0, new Block((currentX - 2), (currentY - 1)));
		shape.Blocks.set(1, new Block((currentX - 1), (currentY - 1)));
		shape.Blocks.set(2, new Block(currentX, (currentY - 1)));
		shape.Blocks.set(3, new Block(currentX, (currentY - 2)));
	}
	
	public function setFullRotation(shape:BaseShape):Void 
	{
		var currentX = shape.Blocks[0].XPosition;
		var currentY = shape.Blocks[0].YPosition;
		
		shape.CurrentRotationStatus = RotationStatus.Full;
		shape.setDefaultShapePosition((currentX + 1), (currentY - 1));
	}
}