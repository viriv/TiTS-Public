package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	public class SkullTattoo extends TattooClass
	{
		public function SkullTattoo() 
		{
			this.tattooType = GLOBAL.TATTOO_SKULL;
			
			addFlag(GLOBAL.TATTOO_FLAG_FACE);
			addFlag(GLOBAL.TATTOO_FLAG_UPPER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_FULL_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_LEG);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_LEG);
		}
		
		public override function getDescription(target:Creature):String
		{
			var matchingRightTattoo:Boolean;
			var matchingLeftTattoo:Boolean;
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "face": ret = "Your entire face is done in a grim-reaper like visage. A skull has been tattooed on it in " + this.color + (this.color == "black" ? "" : ", the sockets of your eyes done in black ink") + ". It gives you a fierce, death-like visage."; break;//docs had typo? "sockets of your done in black ink". Also removed that tidbit if whole tattoo is black anyways
				
				case "upper back": ret = "Anyone looking at your back are left staring into the eye-sockets of a gigantic skull, " + this.color + " and grinning. Side-art stretches out from your boney back-guardian and across your shoulder blades."; break;
				
				case "lower back": ret = "Right above your rump is a skeletal friend, " + this.color + " and toothily smiling."; break;
				
				case "left chest":
					matchingRightTattoo = target.hasRightChestTattooOfType(this.tattooType);
					ret = "A " + (matchingRightTattoo ? "pair of " : "") + this.color + (matchingRightTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.rightChestTattoo.color : "") + " skull" + (matchingRightTattoo ? "s" : "") + " emblazon" + (matchingRightTattoo ? "" : "s") + " the top of " + (matchingRightTattoo ? "both your " + (target.hasBreasts() ? "breasts" : "pecs") : "your left " + (target.hasBreasts() ? "breast" : "pec"))  + ". Ornamental sideart spreads out from " + (matchingRightTattoo ? "their" : "its") + " skeletal sides, drawing even more attention to the artistic mark" + (matchingRightTattoo ? "s" : "") + ".";//seems like L+R are two skulls? and full would be one single skull so L+R don't merge into full
				break;
				
				case "right chest":
					matchingLeftTattoo = target.hasLeftChestTattooOfType(this.tattooType);
					ret = "A " + (matchingLeftTattoo ? "pair of " : "") + this.color + (matchingLeftTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.leftChestTattoo.color : "") + " skull" + (matchingLeftTattoo ? "s" : "") + " emblazon" + (matchingLeftTattoo ? "" : "s") + " the top of " + (matchingLeftTattoo ? "both your " + (target.hasBreasts() ? "breasts" : "pecs") : "your right " + (target.hasBreasts() ? "breast" : "pec"))  + ". Ornamental sideart spreads out from " + (matchingLeftTattoo ? "their" : "its") + " skeletal sides, drawing even more attention to the artistic mark" + (matchingLeftTattoo ? "s" : "" ) + ".";//seems like L+R are two skulls? and full would be one single skull so L+R don't merge into full
				break;
				
				case "full chest"://this is actually different from left + right chest unlike all other tattoo types which were a merge of the two
					ret = "A " + this.color + " skull emblazons the middle of your chest. Ornamental side art spreads out from its skeletal sides and across your " + (target.hasBreasts() ? "upper breasts" : "pecs") + ".";
				break;
				
				case "left arm":
					matchingRightTattoo = target.hasRightArmTattooOfType(this.tattooType);
					ret = "Protecting " + (matchingRightTattoo ? "both your arms are" : "your left arm is a") + " " + this.color + (matchingRightTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " and " + target.rightArmTattoo.color : "") + " skull" + (matchingRightTattoo ? "s" : "") + ".";
				break;
				
				case "right arm":
					matchingLeftTattoo = target.hasLeftArmTattooOfType(this.tattooType);
					ret = "Protecting " + (matchingLeftTattoo ? "both your arms are" : "your right arm is a") + " " + this.color + (matchingLeftTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " and " + target.leftArmTattoo.color : "") + " skull" + (matchingLeftTattoo ? "s" : "") + ".";
				break;
				
				case "left leg"://there were two leg description types one seemingly for lower and the other upper but this is the only tattoo with this distinction so for the time being the second upper tattoo type is ignored
					matchingRightTattoo = target.hasRightLegTattooOfType(this.tattooType);
					ret = (matchingRightTattoo ? "Death-like stamps mark" : "A death-like stamp marks") + " your " + (matchingRightTattoo ? "legs" : "left leg") + ". " + (matchingRightTattoo ? "They're" : "It's") + " literally part of your [pc.skinFurScalesNoun].";
				break;
				
				case "right leg"://there were two leg description types one seemingly for lower and the other upper but this is the only tattoo with this distinction so for the time being the second upper tattoo type is ignored
					matchingLeftTattoo = target.hasLeftLegTattooOfType(this.tattooType);
					ret = (matchingLeftTattoo ? "Death-like stamps mark" : "A death-like stamp marks") + " your " + (matchingLeftTattoo ? "legs" : "right leg") + ". " + (matchingLeftTattoo ? "They're" : "It's") + " literally part of your [pc.skinFurScalesNoun].";
				break;
				
				default: ret = ""; break;
			}
			
			return ret;
		}
	}
}