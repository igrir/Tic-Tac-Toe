package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class TextPemenang extends Entity
	{
		public var textPemenang:Text = new Text("bla", 0, 0, 320,240);
		public function TextPemenang()
		{
			textPemenang.text = "hi!";
			textPemenang.x = 0;
			textPemenang.y = 0;
			
			super(x, y, textPemenang);
		}
		
		override public function update():void{
			textPemenang.text = GV.pemenang;
		}
	}
}