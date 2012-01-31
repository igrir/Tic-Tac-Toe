package
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	public class TicWorld extends World
	{
				
		public static var giliran:Boolean = false;
		
		//menampung data pribadi dari kotak yang sudah dibuat
		
		public function TicWorld()
		{

			addKotak();
			
		}
		
		
		public function addKotak():void{
			//counter
			var i:int;
			var j:int;
			var hitung:int = 0;
			
			var marginLeft:int = 20;
			trace(GV.objArr.length);
			for(i=0;i<3;i++){
				//array kolom
				var arr_kolom:Array = [];
				
				for(j=0;j<3;j++){
										
					//memasukkan kotak ke dunia
					var kotak:Kotak = new Kotak((100*j)+marginLeft,(100*i),1,hitung) 
					add(kotak);
					
					//counter
					hitung++;
					arr_kolom.push(kotak);					
				}
				
				//menaruh array kolom ke dalam array baris
				GV.objArr[i] = arr_kolom;
				
			}
			
			for(i=0;i<3;i++){
				trace(GV.objArr[i][0].nomorKotak+","+GV.objArr[i][1].nomorKotak+","+GV.objArr[i][2].nomorKotak);
			}
			
		}	
	}
}