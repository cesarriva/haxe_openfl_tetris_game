package com.cesar.models.business;
import com.cesar.models.shapes.BaseShape;
import com.cesar.models.shapes.LShape;
import com.cesar.models.shapes.SShape;
import com.cesar.models.shapes.SquareShape;
import com.cesar.models.shapes.TShape;
import com.cesar.models.shapes.IShape;
import com.cesar.models.shapes.enums.ShapeType;
import com.cesar.utils.constants.SizeConstants;

/**
 * ...
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
				return new SquareShape(initialXPosition, initialYPosition);
			case ShapeType.L:
				return new LShape(initialXPosition, initialYPosition);
			case ShapeType.S:
				return new SShape(initialXPosition, initialYPosition);
			case ShapeType.T:
				return new TShape(initialXPosition, initialYPosition);
			case ShapeType.I:
				return new IShape(initialXPosition, initialYPosition);
			default:
				return null;
		}
	}
	
	private static function getRandomShapeType():ShapeType
	{
		
		var radomNumber = Std.random(5);
		
		var selectedType = shapeList[radomNumber];
		
		return selectedType;
	}
}