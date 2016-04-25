package com.cesar.commands;

import com.cesar.commands.signals.ShapeActionSignal;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;

/**
 * Map all signals to its commands
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class CommandConfig implements IConfig
{
	@inject public var commandMap:ISignalCommandMap;
	
	public function new() {	}
	
	public function configure():Void
	{
		//all signals are maped to commands here
		commandMap.map(ShapeActionSignal).toCommand(ShapeActionCommand);
	}
}