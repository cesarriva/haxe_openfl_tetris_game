package com.cesar.models.shapes.rotation;
import com.cesar.models.shapes.BaseShape;

/**
 * @author Cesar Riva
 */
interface IRotationShape 
{
	public function setOneQuarterRotation(shape:BaseShape):Void;
	public function setHalfRotation(shape:BaseShape):Void;
	public function setThreeQuarterRotation(shape:BaseShape):Void;
	public function setFullRotation(shape:BaseShape):Void;
}