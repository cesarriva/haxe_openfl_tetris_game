package com.cesar.views.openfl;

import com.cesar.views.openfl.board.TetrisBoardView;
import com.cesar.views.openfl.board.TetrisBoardViewMediator;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class MainViewMediator extends Mediator
{
	@inject public var mediatorMap:IMediatorMap;
	@inject public var view:MainView;
	
	public function new() {	}
	
	/**
	 * Map views that are inside MainView and initialize the main view
	 * in the app
	 */
	override public function initialize():Void
	{
		mediatorMap.map(TetrisBoardView).toMediator(TetrisBoardViewMediator);
		
		view.Initialize();
	}
}