package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	public class DragonTattoo extends TattooClass
	{
		public function DragonTattoo() 
		{
			this.tattooType = GLOBAL.TATTOO_DRAGON;
			
			addFlag(GLOBAL.TATTOO_FLAG_FACE);
			addFlag(GLOBAL.TATTOO_FLAG_NECK);
			addFlag(GLOBAL.TATTOO_FLAG_UPPER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_LEG);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_LEG);
			addFlag(GLOBAL.TATTOO_FLAG_ABOVE_CROTCH);
		}
		
		public override function getDescription(target:Creature):String
		{
			var matchingRightTattoo:Boolean;
			var matchingLeftTattoo:Boolean;
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "face": ret = "Coiled around and down one of your cheeks is a fierce-looking " + this.color + " dragon, visible for all to see."; break;
				
				case "neck": ret = "Weaving down your spine is a " + this.color + " dragon with claws out, almost stepping down it like a parkour acrobat."; break;
				
				case "upper back": ret = "Fiercely guarding your upper back is a large, " + this.color + " dragon, it's tattooed-on talons visibly bared."; break;
				
				case "lower back": ret = "Stamped above your upper buttocks is a dragon, " + this.color + " of scale, making itself home there."; break;
				
				case "left chest":
					matchingRightTattoo = target.hasRightChestTattooOfType(this.tattooType);
					ret = "Stretching across " + (matchingRightTattoo ? "both" : "the left") + " side" + (matchingRightTattoo ? "s" : "") + " of your chest " + (matchingRightTattoo ? "are " : "is a ") + this.color + (matchingRightTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.rightChestTattoo.color : "") + " dragon" + (matchingRightTattoo ? "s" : "") + ".";
				break;
				
				case "right chest":
					matchingLeftTattoo = target.hasLeftChestTattooOfType(this.tattooType);
					ret = "Stretching across " + (matchingLeftTattoo ? "both" : "the right") + " side" + (matchingLeftTattoo ? "s" : "") + " of your chest " + (matchingLeftTattoo ? "are " : "is a ") + this.color + (matchingLeftTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.leftChestTattoo.color : "") + " dragon" + (matchingLeftTattoo ? "s" : "") + ".";
				break;
				
				case "left arm":
					matchingRightTattoo = target.hasRightArmTattooOfType(this.tattooType);
					ret = "Wrapping around " + (matchingRightTattoo ? "both your arms are " : "your left arm is a ") + this.color + (matchingRightTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " and " + target.rightArmTattoo.color : "") + " dragon tattoo" + (matchingRightTattoo ? "s" :  "") + ".";
				break;
				
				case "right arm":
					matchingLeftTattoo = target.hasLeftArmTattooOfType(this.tattooType);
					ret = "Wrapping around " + (matchingLeftTattoo ? "both your arms are " : "your right arm is a ") + this.color + (matchingLeftTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " and " + target.leftArmTattoo.color : "") + " dragon tattoo" + (matchingLeftTattoo ? "s" :  "") + ".";
				break;
				
				case "left leg":
					matchingRightTattoo = target.hasRightLegTattooOfType(this.tattooType);
					ret = "Running up and around " + (matchingRightTattoo ? "both your legs are " : "your left leg is a ") + this.color + (matchingRightTattoo && target.rightLegTattoo.color != target.leftLegTattoo.color ? " and " + target.rightLegTattoo.color : "") + " dragon tattoo" + (matchingRightTattoo ? "s" :  "") + ".";//docs have error:uses arms here instead of legs
				break;
				
				case "right leg":
					matchingLeftTattoo = target.hasLeftLegTattooOfType(this.tattooType);
					ret = "Running up and around " + (matchingLeftTattoo ? "both your legs are " : "your right leg is a ") + this.color + (matchingLeftTattoo && target.rightLegTattoo.color != target.leftLegTattoo.color ? " and " + target.leftLegTattoo.color : "") + " dragon tattoo" + (matchingLeftTattoo ? "s" :  "") + ".";//docs have error:uses arms here instead of legs
				break;
				
				case "crotch":
					ret = "Above your crotch sits a " + this.color + " dragon, "
					
					if(target.hasCock()) ret += "almost as if it's resting upon your rod" + (target.hasCocks() ? "s" : "") + ".";
					else if(target.hasVagina()) ret += "protecting your thigh-guarded treasure trove.";//TODO: thigh-guarded needed a check? for peeps without legs(thighs)? ie: naga, goo? or [pc.thigh] parser call?
					else ret += "resting above your featureless mound."//altered sitting to resting
					
					ret += " Even though it's a tattoo, the tiny glittering scales look and feel real."
				break;
				
				default: ret = ""; break;
			}
			
			return ret;
		}
	}
}