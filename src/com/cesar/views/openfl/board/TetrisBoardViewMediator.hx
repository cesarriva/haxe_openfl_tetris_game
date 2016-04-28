package com.cesar.views.openfl.board;

import com.cesar.commands.signals.ErrorSignal;
import com.cesar.commands.signals.ShapeActionSignal;
import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.signals.GameOverSignal;
import com.cesar.models.signals.ShapeUpdatedSignal;
import com.cesar.utils.enums.ShapeAction;
import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * Mediate the TetrisBoardView
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class TetrisBoardViewMediator extends Mediator
{
	@inject public var view:TetrisBoardView;
	@inject public var signal:ShapeActionSignal;
	
	@inject public var shapeUpdatedSignal:ShapeUpdatedSignal;
	@inject public var gameOverSignal:GameOverSignal;
	@inject public var errorSignal:ErrorSignal;
	
	public function new() { }
	
	/**
	 * Call view initalization and add listeners for signals
	 * coming from the view and also the dispatcher
	 */
	override public function initialize():Void
	{
		view.Initialize();
		
		view.default_action_signal.add(OnDefaultAction);
		view.rotate_action_signal.add(OnRotateAction);
		view.move_left_action_signal.add(OnMoveLeftAction);
		view.move_right_action_signal.add(OnMoveRightAction);
		view.move_down_action_signal.add(OnMoveDownAction);
		
		shapeUpdatedSignal.add(OnUpdateShapeInTheBoard);
		gameOverSignal.add(OnGameOver);
		errorSignal.add(OnHandlingError);
	}
	
	/**
	 * Called from the view. Handle the default movement
	 * of the shapes
	 */
	private function OnDefaultAction():Void
	{
		signal.dispatch(ShapeAction.DefaultMove);
	}
	
	/**
	 * Called from the view. Handle the rotate movement of the shapes
	 */
	private function OnRotateAction():Void
	{
		signal.dispatch(ShapeAction.RotateMove);
	}
	
	/**
	 * Called from the view. Handle the left movement of the shapes
	 */
	private function OnMoveLeftAction():Void
	{
		signal.dispatch(ShapeAction.LeftMove);
	}
	
	/**
	 * Called from the view. Handle the right movement of the shapes
	 */
	private function OnMoveRightAction():Void
	{
		signal.dispatch(ShapeAction.RightMove);
	}
	
	/**
	 * Called from the view. Handle the down movement of the shapes
	 */
	private function OnMoveDownAction():Void
	{
		signal.dispatch(ShapeAction.DownMove);
	}
	
	/**
	 * Called from the TetrisBoardModel, listening for the signal
	 * when the tetris board model is updated
	 */
	private function OnUpdateShapeInTheBoard(board:TetrisBoardModel):Void
	{
		view.UpdateBoardState(board);
	}
	
	/**
	 * Called from the TetrisBoardModel, listening for the signal when
	 * a shape reaches the top of the board, ending the game
	 */
	private function OnGameOver():Void
	{
		view.FinishTheGame();
	}
	
	private function OnHandlingError(errorMsg:String):Void
	{
		view.showErrorMessage(errorMsg);
	}
}