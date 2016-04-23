package com.cesar.models.shapes;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class IShape extends BaseShape
{
	public function new(x:Int, y:Int) 
	{
		super();
		Blocks.set(0, new Block(x, y));
		Blocks.set(1, new Block(x, (y + 1)));
		Blocks.set(2, new Block(x, (y + 2)));
		Blocks.set(3, new Block(x, (y + 3)));
	}
}