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
			var matchingRightTattoo:Boolean;
			var matchingLeftTattoo:Boolean;
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "neck": ret = "On the back of your neck is a single message in " + this.color + " letters: <i>“" + this.optionalTattooAttribute + "”</i>."; break;
				
				case "upper back": ret = "Across your upper back and in distinctive, " + this.color + " letters, is written: <i>“" + this.optionalTattooAttribute + "”</i>."; break;
				
				case "lower back": ret = "Right above your ass is written <i>“" + this.optionalTattooAttribute + "”</i> in " + this.color + " letters."; break;
				
				case "full chest": ret = "Across your chest, inscribed in " + this.color + " letters, is written: <i>“" + this.optionalTattooAttribute + "”</i>."; break;
				
				case "left arm":
					matchingRightTattoo = target.hasRightArmTattooOfType(this.tattooType);
					ret = "On your left arm is inscribed <i>“" + this.optionalTattooAttribute + "”</i> in " + this.color + " letters" + (matchingRightTattoo ? " and on your right arm is <i>“" + target.rightArmTattoo.optionalTattooAttribute + "”</i>" + (this.color != target.rightArmTattoo.color ? " in " + target.rightArmTattoo.color : "") : "") + ".";
				break;
				
				case "right arm":
					matchingLeftTattoo = target.hasLeftArmTattooOfType(this.tattooType);
					ret = "On your right arm is inscribed <i>“" + this.optionalTattooAttribute + "”</i> in " + this.color + " letters" + (matchingLeftTattoo ? " and on your left arm is <i>“" + target.leftArmTattoo.optionalTattooAttribute + "”</i>" + (this.color != target.leftArmTattoo.color ? " in " + target.leftArmTattoo.color : "" ) : "") + ".";
				break;
				
				case "left buttock":
					matchingRightTattoo = target.hasRightButtTattooOfType(this.tattooType);
					ret = "On your left [pc.skinColor] buttock is written <i>“" + this.optionalTattooAttribute + "”</i>" + (matchingRightTattoo ? " and on your right is <i>“" + target.rightButtTattoo.optionalTattooAttribute + "”</i>. They're" : ". It's") + " tattooed in " + this.color + (matchingRightTattoo && this.color != target.rightButtTattoo.color ? " and " + target.rightButtTattoo.color : "") + " ink" + (matchingRightTattoo && this.color != target.rightButtTattoo.color ? "s" : "") + ".";
				break;
				
				case "right buttock":
					matchingLeftTattoo = target.hasLeftButtTattooOfType(this.tattooType);
					ret = "On your right [pc.skinColor] buttock is written <i>“" + this.optionalTattooAttribute + "”</i>" + (matchingLeftTattoo ? " and on your left is <i>“" + target.leftButtTattoo.optionalTattooAttribute + "”</i>. They're" : ". It's") + " tattooed in " + this.color + (matchingLeftTattoo && this.color != target.leftButtTattoo.color ? " and " + target.leftButtTattoo.color : "") + " ink" + (matchingLeftTattoo && this.color != target.leftButtTattoo.color ? "s" : "") + ".";
				break;
				
				case "crotch": ret = "Right above your crotch and in " + this.color + " letters is written <i>“" + this.optionalTattooAttribute + "”</i>."; break;
				
				default: ret = ""; break;
			}
			
			return ret;
		}
	}
}