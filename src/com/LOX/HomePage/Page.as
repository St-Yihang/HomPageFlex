package com.LOX.HomePage
{
	import away3d.containers.ObjectContainer3D;
	import away3d.lights.LightBase;
	import away3d.textures.Texture2DBase;
	
	public class Page extends ObjectContainer3D
	{
		private var outerFace:Face;
		private var innerFace:Face;
		
		public function Page(width:Number,height:Number,text1:Texture2DBase, text2:Texture2DBase,light:LightBase = null)
		{
			outerFace = new Face(width,height,text1,light);
			innerFace = new Face(width,height,text2,light);
			innerFace.rotationX = 180;
			innerFace.z = -height;
			this.addChild(innerFace);
			this.addChild(outerFace);
		}
	}
}