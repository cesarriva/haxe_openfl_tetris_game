package com.cesar.models.signals;

import com.cesar.models.board.TetrisBoardModel;
import msignal.Signal.Signal1;

/**
 * Signal used to broadcast the message that the tetris board model
 * was update. This signal it's captured by the TetrisBoardViewMediator
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class ShapeUpdatedSignal extends Signal1<TetrisBoardModel>
{
	public function new() 
	{
		super(TetrisBoardModel);
	}	
}