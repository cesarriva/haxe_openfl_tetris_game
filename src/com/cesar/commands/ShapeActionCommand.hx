package com.cesar.commands;

import com.cesar.commands.signals.ErrorSignal;
import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.business.factories.ActionShapeFactory;
import com.cesar.models.business.factories.ShapeFactory;
import com.cesar.utils.enums.ShapeAction;

import robotlegs.bender.bundles.mvcs.Command;

/**
 * Command responsible to handle the tetris board data,
 * by creating a new shape, or handle the movement of a current
 * falling shape. Also handle the type of movement that the
 * shape needs to do (rotate, move left, etc)
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class ShapeActionCommand extends Command
{
	@inject public var tetrisBoardModel:TetrisBoardModel;
	@inject public var shapeAction:ShapeAction;
	@inject public var errorSignal:ErrorSignal;

	public function new() { }
	
	override public function execute():Void
	{
		try
		{
			//if there is no current shape on the board
			if (tetrisBoardModel.get_CurrentShape() == null)
			{
				//creates a random shape and add it to the board
				var shape = ShapeFactory.CreateNewRandomShape();
				if (shape != null)
				{
					tetrisBoardModel.set_CurrentShape(shape);
				}
			}
			else
			{
				//gets the specific action move according the action inputed by the user
				var actionMove = ActionShapeFactory.CreateShapeActionMove(shapeAction, tetrisBoardModel);
				actionMove.moveShape();
			}
		}
		catch (unknown:Dynamic)
		{
			var error:String = "Error occurred while moving the shape: " + Std.string(unknown);
			errorSignal.dispatch(error);			
		}
	}
}