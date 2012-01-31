package
{
	import flash.sampler.getMemberNames;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class TombolReset extends Entity
	{
		[Embed(source="res/btn_reset.png")]public static const RESET:Class;
				
		public var _down:Boolean = false;
		
		public function TombolReset()
		{
			graphic = new Image(RESET);
			setHitbox(163, 45);		
		}
		
		protected function mousePressed():void{
			_down = true;
			reset();
			trace("clicked");
			
			
		}
		
		public function reset():void{
			
			var kotakArr:Array = [];			
			world.getType("kotak", kotakArr);
			
			for each(var k:Kotak in kotakArr){
				k.reset();
			}
			
		}
		
		override public function update():void{
			if(collidePoint(x, y, Input.mouseX, Input.mouseY)){
				if(Input.mousePressed){
					mousePressed();
				}else{
					//mouseOver();
				}
			}
		}
	}
}