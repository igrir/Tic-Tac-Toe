package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	public class Kotak extends Entity
	{
		public var spriteFile:Spritemap;
		public var i:int=0;
		
		//penampung menentukan apakah kotak ini sudah diisi atau belum
		public var sudah:Boolean = false;
		
		//tempat menaruh nama dari kotak
		//buat nyoba aja sih :p
		public var namaKotak:String;
		public var nomorKotak:int;
		
		public var _down:Boolean = false;
		public var _over:Boolean = false;
		
		[Embed (source="res/ticx.png")] public static const TIC: Class;
		
		
		public function Kotak(x:int, y:int, layer:int, nomorKotak:int)
		{
			//super(x, y, graphic, mask);
			spriteFile = new Spritemap(TIC, 100, 100);
			
			spriteFile.add("-",[0]);
			spriteFile.add("X",[1]);
			spriteFile.add("O",[2]);
			
			this.layer = layer;
			this.x = x;
			this.y = y;
			this.nomorKotak = nomorKotak;
			
			graphic = spriteFile;
			
			setHitbox(100, 100);
			type = "kotak";
		}
		
		override public function update():void{
			if(collidePoint(x, y, Input.mouseX, Input.mouseY)){
				if(Input.mousePressed){
					mousePressed();
					cekMenang();
				}else{
					mouseOver();
				}
			}
		}
		
		protected function mousePressed():void{
			_down = true;
			trace("clicked");
			
			//mengecek apakah tombol ini sudah diisi
			if(sudah == false){
				//mengatur giliran dari pemain yang mengklik
				if(TicWorld.giliran == true){
					spriteFile.play("X");
					this.namaKotak = "X";
					TicWorld.giliran = false;
				}else{
					spriteFile.play("O");
					this.namaKotak = "O";
					TicWorld.giliran = true;
				}
				
				//mengeset sudah diklik
				sudah = true;	
				
			}
			
			trace(TicWorld.giliran);
		}
		
		protected function mouseOver():void{
			_over = true;
		}
		
		public function cekMenang():void{
			//counter
			var i:int;
			var j:int;
			
			//counter untuk pengecekan menang
			var counterO:int = 0;
			var counterX:int = 0;
			
			
			/*
			//cek baris pertama
			for(i=0;i<3;i++){
				trace("yang dicek isinya adalah " + GV.objArr[0][i].namaKotak);
				if(GV.objArr[0][i].namaKotak == "O"){
					counterO++;
				}else if(GV.objArr[0][i].namaKotak == "X"){
					counterX++;
				}
			}
			*/
			
			//cek apakah ada 3 jumlah counternya, jika ya, berarti menang
			if(counterO == 3){
				trace("o menang");
			}else{
				trace("o belum menang");
			}
			
			trace("counter O :" + counterO);
			
		}
		
		
	}
}