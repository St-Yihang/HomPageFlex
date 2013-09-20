package com.LOX.HomePage
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.lights.LightBase;
	import away3d.textures.Texture2DBase;

	public class Card extends ObjectContainer3D
	{
		private var frontCover:Page;
		private var backCover:Page;
		private var width:Number;
		private var height:Number;
		private var frontAngel:Number;
		private var deltaFrontAngel:Number;
		private var deltaBackAngel:Number;
		private var backAngel:Number;
		private var thisY:Number;
		private var deltaY:Number;
		private var timer:Timer;
		public function Card(width:Number,height:Number,text01:Texture2DBase,text02:Texture2DBase,text11:Texture2DBase,text12:Texture2DBase,light:LightBase = null)
		{
			this.width = width;
			this.height = height;
			frontCover = new Page(width,height,text01,text02,light);
			backCover = new Page(width,height,text11,text12,light);
			backCover.z = height>>1;
			frontCover.z = height>>1;
			backCover.rotationX = -1;
			
			this.rotationX = -90;
			this.addChild(backCover);
			this.addChild(frontCover);
		}
		public function closeCard():void
		{
			frontAngel = 0;
			deltaFrontAngel = frontAngel- frontCover.rotationX;
			backAngel = -1;
			deltaBackAngel = backAngel- backCover.rotationX;
			thisY = 0;
			deltaY = thisY - this.y;
			setTimer();
		}
		public function openCard():void
		{
			frontAngel = 180;
			deltaFrontAngel = frontAngel- frontCover.rotationX;
			backAngel = 90;
			deltaBackAngel = backAngel- backCover.rotationX;
			thisY = -this.height ;
			deltaY = thisY - this.y;
			setTimer();
		}
		private function setTimer():void
		{
			if(timer== null)
				timer = new Timer(1,50);
			timer.reset();
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, OnAnimation);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, OnAnimationFinished);
		}
		private function OnAnimationFinished(e:TimerEvent):void
		{
			timer.removeEventListener(TimerEvent.TIMER,OnAnimation);
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,OnAnimationFinished);
			frontCover.rotationX = frontAngel;
			backCover.rotationX = backAngel;
			this.y = thisY;
		}
		private function OnAnimation(e:TimerEvent):void
		{
			if(frontCover.rotationX != frontAngel)
				frontCover.rotationX += deltaFrontAngel/timer.repeatCount;
			if(backCover.rotationX != backAngel)
				backCover.rotationX += deltaBackAngel/timer.repeatCount;
			if(this.y != thisY)
				this.y += deltaY/timer.repeatCount;
		}
	}
}