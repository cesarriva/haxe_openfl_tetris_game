package com.cesar.models.shapes;

import com.cesar.models.shapes.enums.RotationStatus;
import com.cesar.models.shapes.rotation.IRotationShape;

import haxe.ds.Vector;

/**
 * Represents a base shape, that all concrete bases must extends
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class BaseShape
{
	/**
	 * Vector used to hold 4 blocks that are responsible to assembly one shape
	 */
	@:isVar public var Blocks(get, set):Vector<Block>;
	
	/**
	 * Stores the current rotation position status
	 */
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
	
	/**
	 * Abstract method implemented by the concrete shapes
	 * @param	x
	 * @param	y
	 */
	public function setDefaultShapePosition(x:Int, y:Int):Void { }
}