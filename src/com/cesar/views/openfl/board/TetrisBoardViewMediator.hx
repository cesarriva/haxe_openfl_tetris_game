package com.cesar.views.openfl.board;

import com.cesar.commands.signals.ShapeActionSignal;
import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.signals.ShapeUpdatedSignal;
import com.cesar.utils.enums.ShapeAction;
import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class TetrisBoardViewMediator extends Mediator
{
	@inject public var view:TetrisBoardView;
	@inject public var signal:ShapeActionSignal;
	@inject public var shapeUpdatedSignal:ShapeUpdatedSignal;
	
	public function new() { }
	
	override public function initialize():Void
	{
		view.Initialize();
		view.default_action_signal.add(OnDefaultAction);
		view.rotate_action_signal.add(OnRotateAction);
		view.move_left_action_signal.add(OnMoveLeftAction);
		view.move_right_action_signal.add(OnMoveRightAction);
		view.move_down_action_signal.add(OnMoveDownAction);
		
		shapeUpdatedSignal.add(OnUpdateShapeInTheBoard);
	}
	
	private function OnDefaultAction():Void
	{
		signal.dispatch(ShapeAction.DefaultMove);
	}
	
	private function OnRotateAction():Void
	{
		signal.dispatch(ShapeAction.RotateMove);
	}
	
	private function OnMoveLeftAction():Void
	{
		signal.dispatch(ShapeAction.LeftMove);
	}
	
	private function OnMoveRightAction():Void
	{
		signal.dispatch(ShapeAction.RightMove);
	}
	
	private function OnMoveDownAction():Void
	{
		signal.dispatch(ShapeAction.DownMove);
	}
	
	private function OnUpdateShapeInTheBoard(board:TetrisBoardModel):Void
	{
		view.UpdateBoardState(board);
	}
}