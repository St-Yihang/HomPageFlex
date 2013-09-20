package com.LOX.HomePage
{
	import away3d.containers.ObjectContainer3D;
	import away3d.core.pick.PickingColliderType;
	import away3d.entities.Mesh;
	import away3d.lights.LightBase;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.PlaneGeometry;
	import away3d.textures.Texture2DBase;

	public class Face extends ObjectContainer3D
	{
		private var background:Mesh;
		private var backTexture:Texture2DBase;
		private var backMaterial:TextureMaterial;
		
		public function Face(width:Number,height:Number,texture:Texture2DBase, light:LightBase = null)
		{
			backTexture = texture;
			backMaterial = new TextureMaterial(backTexture);
			background = new Mesh(new PlaneGeometry(width,height), backMaterial);
			background.z = -height>>1;
			background.pickingCollider = PickingColliderType.AS3_BEST_HIT;
			if(light != null)
				backMaterial.lightPicker = new StaticLightPicker([light])
			background.mouseEnabled = true;
			this.addChild(background);
		}
		public function changeBackTexture(texture:Texture2DBase):void
		{
			backTexture = texture;
			backMaterial.texture = backTexture;
			background.material = backMaterial;
		}
			
	}
}