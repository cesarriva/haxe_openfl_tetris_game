package com.cesar.views;

import com.cesar.views.openfl.MainView;
import com.cesar.views.openfl.MainViewMediator;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.contextView.ContextView;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class ViewConfig implements IConfig
{
	@inject public var context:IContext;
	@inject public var mediatorMap:IMediatorMap;
	@inject public var contextView:ContextView;
	
	public function new() {	}
	
	public function configure():Void
	{
		context.afterInitializing(init);
	}
	
	private function init():Void
	{
		mapMediators();
		initMainView();
	}
	
	private function mapMediators():Void
	{
		mediatorMap.map(MainView).toMediator(MainViewMediator);
	}
	
	private function initMainView():Void
	{
		contextView.view.addChild(new MainView());
	}
}