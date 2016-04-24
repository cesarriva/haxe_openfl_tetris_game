package com.cesar.commands;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.business.factories.ActionShapeFactory;
import com.cesar.models.business.factories.ShapeFactory;
import com.cesar.utils.enums.ShapeAction;

import robotlegs.bender.bundles.mvcs.Command;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class ShapeActionCommand extends Command
{
	@inject public var tetrisBoardModel:TetrisBoardModel;
	@inject public var shapeAction:ShapeAction;

	public function new() { }
	
	override public function execute():Void
	{
		if (tetrisBoardModel.get_CurrentShape() == null)
		{
			var shape = ShapeFactory.CreateNewRandomShape();
			if (shape != null)
			{
				tetrisBoardModel.set_CurrentShape(shape);
			}
		}
		else
		{
			var actionMove = ActionShapeFactory.CreateShapeActionMove(shapeAction, tetrisBoardModel);
			actionMove.moveShape();
		}
	}
}