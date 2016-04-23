package com.cesar.views.openfl.board;

import com.cesar.commands.signals.DefaultActionSignal;
import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.signals.ShapeUpdatedSignal;
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
	@inject public var signal:DefaultActionSignal;
	@inject public var shapeUpdatedSignal:ShapeUpdatedSignal;
	
	public function new() { }
	
	override public function initialize():Void
	{
		view.Initialize();
		view.default_action_signal.add(OnDefaultAction);
		view.rotate_action_signal.add(OnRotateAction);
		view.move_left_action_signal.add(OnMoveLeftAction);
		view.move_right_action_signal.add(OnMoveRightAction);
		
		shapeUpdatedSignal.add(OnUpdateShapeInTheBoard);
		
	}
	
	private function OnDefaultAction():Void
	{
		signal.dispatch();
	}
	
	private function OnRotateAction():Void
	{
		
	}
	
	private function OnMoveLeftAction():Void
	{
		
	}
	
	private function OnMoveRightAction():Void
	{
		
	}
	
	private function OnUpdateShapeInTheBoard(board:TetrisBoardModel):Void
	{
		view.UpdateBoardState(board);
	}
}