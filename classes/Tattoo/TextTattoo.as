package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	public class TextTattoo extends TattooClass
	{
		public function TextTattoo()
		{
			this.tattooType = GLOBAL.TATTOO_TEXT;
			
			addFlag(GLOBAL.TATTOO_FLAG_NECK);
			addFlag(GLOBAL.TATTOO_FLAG_UPPER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_FULL_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_BUTT);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_BUTT);
			addFlag(GLOBAL.TATTOO_FLAG_ABOVE_CROTCH);
		}
		
		public override function getDescription(target:Creature):String
		{
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "neck": ret = "On the back of your neck is a single message in " + this.color + " letters: “" + this.optionalTattooAttribute + "”."; break;
				
				case "upper back": ret = "Across your upper back and in distinctive, " + this.color + " letters, is written: “" + this.optionalTattooAttribute + "”."; break;
				
				case "lower back": ret = "Right above your [pc.ass] is written “" + this.optionalTattooAttribute + "” in " + this.color + " letters."; break;
				
				case "full chest": ret = "Across your [pc.chest], inscribed in " + this.color + " letters, is written: “" + this.optionalTattooAttribute + "”."; break;
				
				case "left arm": ret = "On your left arm is inscribed “" + this.optionalTattooAttribute + "” in " + this.color + " letters."; break;//todo left + right
				
				case "right arm": ret = "On your right arm is inscribed “" + this.optionalTattooAttribute + "” in " + this.color + " letters."; break;
				
				case "left buttock": ret = "On your left [pc.skinColor] buttock is written “" + this.optionalTattooAttribute + "”. It's tattooed in " + this.color + " ink."; break;
				
				case "right buttock": ret = "On your right [pc.skinColor] buttock is written “" + this.optionalTattooAttribute + "”. It's tattooed in " + this.color + " ink."; break;
				
				case "crotch": ret = "Right above your crotch and in " + this.color + " letters is written “" + this.optionalTattooAttribute + "”."; break;
				
				default: ret = ""; break;
			}
			
			return ret;
		}
	}
}