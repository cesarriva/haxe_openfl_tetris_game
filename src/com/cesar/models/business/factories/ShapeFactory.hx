package com.cesar.models.business.factories;

import com.cesar.models.shapes.BaseShape;
import com.cesar.models.shapes.LShape;
import com.cesar.models.shapes.SShape;
import com.cesar.models.shapes.SquareShape;
import com.cesar.models.shapes.TShape;
import com.cesar.models.shapes.IShape;
import com.cesar.models.shapes.enums.ShapeType;
import com.cesar.models.shapes.rotation.IRotation;
import com.cesar.models.shapes.rotation.LRotation;
import com.cesar.models.shapes.rotation.SRotation;
import com.cesar.models.shapes.rotation.SquareRotation;
import com.cesar.models.shapes.rotation.TRotation;
import com.cesar.utils.constants.SizeConstants;

/**
 * Factory responsible to generate a random shape used in the tetris game
 * @author Cesar Riva
 */
class ShapeFactory
{
	public function new() {	}
	
	private static var shapeList = [ShapeType.Square, ShapeType.L, ShapeType.S, ShapeType.T, ShapeType.I];
	
	public static function CreateNewRandomShape():BaseShape
	{	
		var shapeType = getRandomShapeType();
		
		var initialXPosition = SizeConstants.SHAPE_INITIAL_X_POSITION;
		var initialYPosition = SizeConstants.SHAPE_INITIAL_Y_POSITION;
		
		switch (shapeType) 
		{
			case ShapeType.Square :
				return new SquareShape(initialXPosition, initialYPosition, new SquareRotation());
			case ShapeType.L:
				return new LShape(initialXPosition, initialYPosition, new LRotation());
			case ShapeType.S:
				return new SShape(initialXPosition, initialYPosition, new SRotation());
			case ShapeType.T:
				return new TShape(initialXPosition, initialYPosition, new TRotation());
			case ShapeType.I:
				return new IShape(initialXPosition, initialYPosition, new IRotation());
			default:
				return null;
		}
	}
	
	private static function getRandomShapeType():ShapeType
	{	
		var radomNumber = Std.random(5);	
		var selectedType = shapeList[radomNumber];
		
		return selectedType;
		//return ShapeType.S;
	}
}