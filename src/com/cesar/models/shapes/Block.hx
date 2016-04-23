package com.cesar.models.shapes;

/**
 * Represents a block unit in the tetris board, with
 * a X coordinate and a Y coordinate
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class Block
{
	public function new(x:Int, y:Int) 
	{
		set_XPosition(x);
		set_YPosition(y);
	}
	
	@:isVar public var XPosition(get, set):Int;
	@:isVar public var YPosition(get, set):Int;
	
	function get_XPosition():Int
	{
		return XPosition;
	}
	
	function set_XPosition(value:Int):Int
	{
		return XPosition = value;
	}
	
	function get_YPosition():Int
	{
		return YPosition;
	}
	
	function set_YPosition(value:Int):Int
	{
		return YPosition = value;
	}
}