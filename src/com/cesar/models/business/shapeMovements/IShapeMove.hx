package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;

/**
 * Simple shape movement interface
 * @author Cesar Riva
 */
interface IShapeMove 
{
	/**
	 * Move and update shape's block positions
	 * @param	shape
	 */
	public function move(shape:BaseShape):Void;
	
	/**
	 * Check the board limit according the type of the movement
	 * @param	shape
	 * @return
	 */
	public function shapeReachedBoardLimits(shape:BaseShape):Bool;
}