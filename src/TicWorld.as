package
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	public class TicWorld extends World
	{
				
	
		//menampung data pribadi dari kotak yang sudah dibuat
		
		public function TicWorld()
		{
			add(new TextPemenang());
			
			var tombolReset:TombolReset = new TombolReset();
			add(tombolReset);
			tombolReset.x = 350;
			tombolReset.y = 300;
			
			addKotak();
			
			
		}
		
		
		public function addKotak():void{
			//counter
			var i:int;
			var j:int;
			var hitung:int = 0;
			
			var marginLeft:int = 20;
			var marginTop:int = 50;
			
			trace(GV.objArr.length);
			for(i=0;i<3;i++){
				//array kolom
				var arr_kolom:Array = [];
				
				for(j=0;j<3;j++){
										
					//memasukkan kotak ke dunia
					var kotak:Kotak = new Kotak((100*j)+marginLeft,(100*i)+marginTop,1,hitung) 
					add(kotak);
					
					//counter
					hitung++;
					arr_kolom.push(kotak);					
				}
				
				//menaruh array kolom ke dalam array baris
				GV.objArr[i] = arr_kolom;
				
			}
		}	
	}
}