package com.cesar.models.business.factories;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.business.shapeMovements.ShapeMovement;
import com.cesar.models.business.shapeMovements.DefaultShapeMove;
import com.cesar.models.business.shapeMovements.IShapeMove;
import com.cesar.models.business.shapeMovements.LeftShapeMove;
import com.cesar.models.business.shapeMovements.RightShapeMove;
import com.cesar.models.business.shapeMovements.RotateShapeMove;
import com.cesar.utils.enums.ShapeAction;

/**
 * Factory responsible to return a specific ShapeMovement according to the shape action that needs to be
 * executed
 * @author Cesar Riva
 */
class ActionShapeFactory
{	
	public function new() { }
	
	public static function CreateShapeActionMove(action:ShapeAction, tetrisBoardModel:TetrisBoardModel):ShapeMovement
	{
		switch (action) 
		{
			case ShapeAction.DefaultMove:
				return new ShapeMovement(new DefaultShapeMove(), tetrisBoardModel);
				
			case ShapeAction.RotateMove:
				return new ShapeMovement(new RotateShapeMove(), tetrisBoardModel);
				
			case ShapeAction.RightMove:
				return new ShapeMovement(new RightShapeMove(), tetrisBoardModel);
				
			case ShapeAction.LeftMove:
				return new ShapeMovement(new LeftShapeMove(), tetrisBoardModel);
				
			case ShapeAction.DownMove:
				return new ShapeMovement(new DefaultShapeMove(), tetrisBoardModel);
				
			default:
				return null;
		}
	}
}