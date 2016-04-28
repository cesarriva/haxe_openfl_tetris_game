package com.cesar.models.business.gameRules;

import com.cesar.models.shapes.BaseShape;

/**
 * Implementation of ICheckGameOver to check the game over
 * @author Cesar Riva
 */
class CheckGameOver implements ICheckGameOver
{
	public function new() { }
	
	/**
	 * Check if the shape reach the top of the board, if yes,
	 * returns true, otherwise, returns false
	 * @param	shape
	 * @return
	 */
	public function actualShapeReachTheTop(shape:BaseShape):Bool
	{
		var reach:Bool = false;

		for (i in 0...shape.Blocks.length) 
		{
			if (shape.Blocks[i].YPosition == 0)
			{
				reach = true;
				break;
			}
		}
		return reach;
	}
}