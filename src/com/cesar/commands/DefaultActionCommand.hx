package com.cesar.commands;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.business.ShapeFactory;
import robotlegs.bender.bundles.mvcs.Command;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class DefaultActionCommand extends Command
{
	@inject public var tetrisBoardModel:TetrisBoardModel;

	public function new() { }
	
	override public function execute():Void
	{
		if (tetrisBoardModel.get_CurrentShape() == null)
		{
			tetrisBoardModel.set_CurrentShape(ShapeFactory.CreateNewRandomShape());
		}
		else
		{
			tetrisBoardModel.downShapeByOneUnit();
		}
	}
}