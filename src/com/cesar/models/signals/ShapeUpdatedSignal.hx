package com.cesar.models.signals;

import com.cesar.models.board.TetrisBoardModel;
import msignal.Signal.Signal1;

/**
 * ...
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