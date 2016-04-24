package com.cesar.commands.signals;

import com.cesar.utils.enums.ShapeAction;
import msignal.Signal.Signal1;

/**
 * ...
 * @author Cesar Riva
 */
class ShapeActionSignal extends Signal1<ShapeAction>
{
	public function new() 
	{
		super(ShapeAction);
	}	
}