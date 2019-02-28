package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	import flash.utils.getQualifiedClassName;
	import classes.Engine.Utility.rand;
	public class BarcodedTattoo extends TattooClass
	{
		public function BarcodedTattoo() 
		{
			this.color = "black"
			this.tattooType = GLOBAL.TATTOO_BARCODED;
			this.tattooLocation = "left buttock";
			
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_BUTT);
		}
		
		public override function getDescription(target:Creature):String
		{
			var targetIsPC:Boolean = false;
			if(getQualifiedClassName(target) == "classes.Characters::PlayerCharacter") targetIsPC = true;
			if(rand(2) == 0) return "There’s a barcode on " + (targetIsPC ? "your":"[target.hisHer]") + " left butt cheek, forever marking " + (targetIsPC ? "you":"[target.himHer]") + " as the property of Belle and Accu-Pitch Labs.";
			else return "On one of " + (targetIsPC ? "your":"[target.hisHer]") + " ass cheeks is a barcode, placed there by Dr. Belle for her scientific research, and to remind " + (targetIsPC ? "you":"[target.himHer]") + " of " + (targetIsPC ? "your":"[target.hisHer]") + " place as her pet.";
		}
		
		public override function onEquip(target:Creature):void
		{
			target.createPerk("Barcoded",0,0,0,0,"A sleek black barcode is printed on your ass, left there by Dr. Belle for purely scientific purposes.")
		}
		
		public override function onRemove(target:Creature):void
		{
			target.removePerk("Barcoded");
		}
	}
}