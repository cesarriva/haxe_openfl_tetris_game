package com.cesar.models.business.gameRules;
import com.cesar.models.shapes.BaseShape;

/**
 * Interface to check the end of the game
 * @author Cesar Riva
 */
interface ICheckGameOver 
{
	public function actualShapeReachTheTop(shape:BaseShape):Bool;
}