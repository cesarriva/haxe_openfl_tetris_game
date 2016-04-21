package com.cesar.commands;

import robotlegs.bender.framework.api.IConfig;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class CommandConfig implements IConfig
{
	public function new() {	}
	
	public function configure():Void
	{
		//all signals are maped to commands here
	}
}