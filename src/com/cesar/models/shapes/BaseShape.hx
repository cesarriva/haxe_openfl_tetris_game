package com.cesar.models.shapes;

import com.cesar.models.shapes.enums.RotationStatus;
import com.cesar.models.shapes.rotation.IRotationShape;

import haxe.ds.Vector;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class BaseShape
{
	@:isVar public var Blocks(get, set):Vector<Block>;
	@:isVar public var CurrentRotationStatus(get, set):RotationStatus;
	
	public var rotationShape(default, null):IRotationShape;

	public function new(rotationShape:IRotationShape) 
	{
		Blocks = new Vector<Block>(4);
		CurrentRotationStatus = RotationStatus.Full;
		this.rotationShape = rotationShape;
	}
	
	function get_Blocks():Vector<Block>
	{
		return Blocks;
	}
	
	function set_Blocks(value:Vector<Block>):Vector<Block>
	{
		return Blocks = value;
	}
	
	function get_CurrentRotationStatus():RotationStatus
	{
		return CurrentRotationStatus;
	}
	
	function set_CurrentRotationStatus(value:RotationStatus):RotationStatus
	{
		return CurrentRotationStatus = value;
	}
	
	public function setDefaultShapePosition(x:Int, y:Int):Void { }
}