package com.cesar.models.business.shapeMovements;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.business.factories.ShapeFactory;
import com.cesar.models.shapes.BaseShape;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class ShapeMovement
{
	private var boardModel:TetrisBoardModel;
	
	private var iShapeMove:IShapeMove;
	
	public function new(iShapeMove:IShapeMove, tetrisBoardModel:TetrisBoardModel)
	{
		this.iShapeMove = iShapeMove;
		boardModel = tetrisBoardModel;
	}
	
	public function moveShape():Void 
	{
		var clonedShape = ShapeFactory.cloneShape(boardModel.get_CurrentShape());
		iShapeMove.move(clonedShape);
		
		if (!iShapeMove.shapeReachedBoardLimits(clonedShape) && !shapeCollided(clonedShape))
		{
			//Shape can keep moving
			boardModel.set_CurrentShape(clonedShape);
		}
		else
		{
			if (Std.is(iShapeMove, DefaultShapeMove))
			{
				//Shape reached the bottom limit or reached another existing peace
				boardModel.landShape();
				boardModel.set_CurrentShape(null);
			}
			else
			{
				//var baseShapeMove = new ShapeMovement(new DefaultShapeMove(), boardModel);
				//baseShapeMove.moveShape();
				boardModel.set_CurrentShape(boardModel.get_CurrentShape());
			}
		}
	}
	
	public function shapeCollided(shape:BaseShape):Bool
	{
		var collided:Bool = false;
		var boardPosition = boardModel.get_Board();
		
		for (i in 0...shape.Blocks.length) 
		{
			var blockXPos = shape.Blocks[i].XPosition;
			var blockYPos = shape.Blocks[i].YPosition;
			
			var blockPositionIsFilled:Bool = boardPosition[blockXPos][blockYPos];
			
			if (blockPositionIsFilled)
			{
				collided = true;
				break;
			}
		}
		
		return collided;
	}
}