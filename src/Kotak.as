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
			if(GV.sudahAdaYangMenang == false){
				//mengecek apakah tombol ini sudah diisi
				if(sudah == false){
					//mengatur giliran dari pemain yang mengklik
					if(GV.giliran == true){
						spriteFile.play("X");
						this.namaKotak = "X";
						GV.giliran = false;
					}else{
						spriteFile.play("O");
						this.namaKotak = "O";
						GV.giliran = true;
					}
					
					//mengeset sudah diklik
					sudah = true;	
				}else{
					trace("sudah di klik");
				}
			}else{
				trace("sudah ada yang menang");
				trace("pemenangnya :"+GV.pemenang);
			}
		}
		
		protected function mouseOver():void{
			_over = true;
		}
		
		public function cekMenang():void{
			//counter
			var kolom:int = 0;
			var baris:int = 0;
			
			//counter untuk pengecekan menang
			var counterO:int = 0;
			var counterX:int = 0;
			
			
			//CEK HORIZONTAL ---------------------------------------------------------
			
			//cara pengecekan dengan menghitung apakah setiap kolom ada 3 yang sama
			//dan lakukan terus sebanyak 3 baris
			
			while(counterO != 3 && counterX != 3 && baris<3){
				
				//reset dulu counterO dan counterX untuk penghitungan berikutnya
				counterO = 0;
				counterX = 0;
				
				for(kolom=0;kolom<3;kolom++){
					if(GV.objArr[baris][kolom].namaKotak == "O"){
						counterO++;
					}else if(GV.objArr[baris][kolom].namaKotak == "X"){
						counterX++;
					}
				}
				//berpindah ke baris berikutnya
				baris++;
				
			}
					
			
			//reset dulu baris dan kolom untuk pengecekan modus berikutnya
			baris = 0;
			kolom = 0;
			
			//CEK VERTIKAL ---------------------------------------------------------
			
			//cara pengecekan dengan menghitung apakah setiap baris ada 3 yang sama
			//dan lakukan terus sebanyak 3 kolom
			
			while(counterO != 3 && counterX != 3 && kolom<3){
				
				//reset dulu counterO dan counterX untuk penghitungan berikutnya
				counterO = 0;
				counterX = 0;
				
				
				for(baris=0;baris<3;baris++){
					if(GV.objArr[baris][kolom].namaKotak == "O"){
						counterO++;
					}else if(GV.objArr[baris][kolom].namaKotak == "X"){
						counterX++;
					}
				}

				//berpindah ke baris berikutnya
				kolom++;
				
			}
			
			//CEK DIAGONAL ---------------------------------------------------------
			
			//cara pengecekan dengan menghitung apakah setiap diagonal ada 3 yang sama
			//dan lakukan terus sebanyak 3 kali
			
			//----diagonal naik
			
			if(counterO != 3 && counterX != 3){
				counterO = 0;
				counterX = 0;
				
				baris = 2;
				
				while(counterO != 3 && counterX != 3 && baris>=0){							
					
					if(GV.objArr[baris][2-baris].namaKotak == "O"){
						counterO++;
					}else if(GV.objArr[baris][2-baris].namaKotak == "X"){
						counterX++;
					}
					//berpindah ke baris berikutnya
					baris--;
					
				}
			}
			
			
			if(counterO != 3 && counterX != 3){
				counterO = 0;
				counterX = 0;
				
				//----diagonal turun
				
				baris = 0;
				
				//reset dulu counterO dan counterX untuk penghitungan berikutnya
				counterO = 0;
				counterX = 0;	
				
				while(counterO != 3 && counterX != 3 && baris<=2){							
					
					if(GV.objArr[baris][baris].namaKotak == "O"){
						counterO++;
					}else if(GV.objArr[baris][baris].namaKotak == "X"){
						counterX++;
					}

					//berpindah ke baris berikutnya
					baris++;
					
				}
			}
			
			
			
			//cek apakah ada 3 jumlah counternya, jika ya, berarti menang
			if(counterO == 3){
			
				
				//menandakan sudah ada yang menang
				GV.sudahAdaYangMenang = true;
				GV.pemenang = "Pemenangnya adalah O"
			}else if(counterX == 3){
			
				//menandakan sudah ada yang menang
				GV.sudahAdaYangMenang = true;
				GV.pemenang = "Pemenangnya adalah X";
			}else{
				
				GV.pemenang = "Belum ada yang menang";
			}
			
			
		}
		
		public function reset():void{
			
			//penampung menentukan apakah kotak ini sudah diisi atau belum
			this.sudah = false;
			this.spriteFile.play("-");
			
			this.namaKotak = "";
			
			GV.giliran = false;
			GV.pemenang = "";
			GV.sudahAdaYangMenang = false;

			trace("semuanya direset");
		}
		
		
	}
}