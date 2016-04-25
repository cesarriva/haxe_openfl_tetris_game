package com.cesar.commands.signals;

import com.cesar.utils.enums.ShapeAction;
import msignal.Signal.Signal1;

/**
 * Signal mapped to the ShapeActionCommand. It is sent
 * directly from the TetrisBoardMediator. Contains one
 * ShapeAction parameter so the command can distinguish
 * about what shape movement must be handled
 * @author Cesar Riva
 */
class ShapeActionSignal extends Signal1<ShapeAction>
{
	public function new() 
	{
		super(ShapeAction);
	}	
}