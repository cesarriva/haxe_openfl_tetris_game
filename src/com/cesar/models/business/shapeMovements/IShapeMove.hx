package com.cesar.models.business.shapeMovements;
import com.cesar.models.shapes.BaseShape;

/**
 * @author Cesar Riva
 */
interface IShapeMove 
{
	public function move(shape:BaseShape):Void;
	public function shapeReachedBoardLimits(shape:BaseShape):Bool;
}