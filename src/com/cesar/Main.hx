package com.cesar;

import openfl.display.Sprite;
import openfl.Lib;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

import com.cesar.commands.CommandConfig;
import com.cesar.models.ModelConfig;
import com.cesar.views.ViewConfig;

/**
 * ...
 * @author Cesar Riva
 */
class Main extends Sprite 
{
	private var _context:IContext;

	public function new() 
	{
		super();
		
		_context = new Context()
			.install([MVCSBundle])
			.configure([CommandConfig, ModelConfig, ViewConfig])
			.configure(new ContextView(this));
	}
}
