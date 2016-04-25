package com.cesar.models;

import com.cesar.models.board.TetrisBoardModel;
import com.cesar.models.signals.GameOverSignal;
import com.cesar.models.signals.ShapeUpdatedSignal;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

/**
 * Do all injections used in the application
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class ModelConfig implements IConfig
{
	@inject public var injector:IInjector;
	
	public function new() { }
	
	public function configure():Void
	{
		injector.map(TetrisBoardModel).asSingleton();
		injector.map(ShapeUpdatedSignal).asSingleton();
		injector.map(GameOverSignal).asSingleton();
	}
}