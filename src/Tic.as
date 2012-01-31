package
{
	import flash.display.Sprite;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="500", height="450")]
	public class Tic extends Engine
	{
		public function Tic()
		{			
			super(500, 450, 12, false);
			FP.world = new TicWorld();
		}
	}
}