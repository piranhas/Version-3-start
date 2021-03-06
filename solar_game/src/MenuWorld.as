package  
{
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
	
	public class MenuWorld extends CustomWorld
	{
		[Embed(source = 'assets/background/ground.png')] private const GROUND:Class;
		[Embed(source = 'assets/background/cloud2.png')] private const CLOUD2:Class;
		[Embed(source = 'assets/background/cloud1.png')] private const CLOUD1:Class;
		[Embed(source = 'assets/background/sky.png')] private const SKY:Class;
		[Embed(source = 'assets/background/spacebar.png')] private const SPACEBAR1:Class;
		[Embed(source = 'assets/background/arrowkeys.png')] private const ARROWKEYS:Class;
		private var cloud1:Cloud;
		private var cloud2:Cloud;
		private var sky:Entity;
		private var sun:Sun = new Sun();
		private var trees:TreeManager = new TreeManager();
	//	private var spacebar1:Entity;
	//	private var arrowkeys:Entity;
		private var text:Text = new Text("Click here to Start!", 50, 0, { size:50, color: 0x000000 } );
		private var text2:Text = new Text("Use Arrow keys to play", 50, 60, { size:50, color: 0x000000 } );
		private var text3:Text = new Text("Presented by: ", 50, 120, { size:20, color: 0x000000 } );
		private var text4:Text = new Text("Dermatology Nurses Association", 50, 140, { size:20, color: 0x000000 } );
		private var text5:Text = new Text("BCIT Game Development Club", 50, 160, { size:20, color: 0x000000 } );
		private var text6:Text = new Text("Langara School of Nursing", 50, 180, { size:20, color: 0x000000 } );
		public function MenuWorld() 
		{
		//	spacebar1 = new Entity(0, 10, new Image(SPACEBAR1));
		//	arrowkeys = new Entity(50, 60, new Image(ARROWKEYS));
			sky = new Entity(0, 0, new Image(SKY));
			cloud1 = new Cloud(-125, 129, new Image(CLOUD1));
			cloud2 = new Cloud( -125, 129, new Image(CLOUD2));
		//	spacebar1.layer = -4;
			sky.layer = 0;
			cloud1.layer = -2;
			cloud2.layer = -3;
			add(sky);
			add(cloud1);
			add(cloud2);
			add(new ShiftableEntity(0, 258, new Image(GROUND),-254));
			add(sun);
			add(trees.getFirst());
			add(trees.getLast());
			add(new ShiftableEntity(0, 0, Image.createRect(FP.width, FP.height, 0xFFFFFF, 0.5), 99999));
		//	add(spacebar1);
		//	add(arrowkeys);
			addGraphic(text);
			addGraphic(text2);
			addGraphic(text3);
			addGraphic(text4);
			addGraphic(text5);
			addGraphic(text6);
		}
		
		override public function update():void 
		{
			if (Input.check(Key.SPACE) || Input.mousePressed) {
				done = true;
			}
			sun.setX(FP.width / 180 * FP.elapsed + sun.getX());
			super.update();
		}
	}

}