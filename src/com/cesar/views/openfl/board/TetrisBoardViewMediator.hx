package com.cesar.views.openfl.board;

import robotlegs.bender.bundles.mvcs.Mediator;

/**
 * ...
 * @author Cesar Riva
 */
@:rtti
@:keepSub
class TetrisBoardViewMediator extends Mediator
{
	@inject public var view:TetrisBoardView;
	
	public function new() { }
	
	override public function initialize():Void
	{
		view.Initialize();
	}
}