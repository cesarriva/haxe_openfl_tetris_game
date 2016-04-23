package com.cesar.models.shapes;
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

	public function new() 
	{
		Blocks = new Vector<Block>(4);
	}
	
	function get_Blocks():Vector<Block>
	{
		return Blocks;
	}
	
	function set_Blocks(value:Vector<Block>):Vector<Block>
	{
		return Blocks = value;
	}
}