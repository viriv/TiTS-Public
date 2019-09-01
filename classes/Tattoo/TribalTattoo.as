package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	public class TribalTattoo extends TattooClass
	{	
		public function TribalTattoo() 
		{
			this.tattooType = GLOBAL.TATTOO_TRIBAL;
			
			addFlag(GLOBAL.TATTOO_FLAG_FACE);
			addFlag(GLOBAL.TATTOO_FLAG_NECK);
			addFlag(GLOBAL.TATTOO_FLAG_UPPER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_FULL_CHEST);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_ARM);
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_LEG);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_LEG);
			addFlag(GLOBAL.TATTOO_FLAG_RHETT_TATTOO);
		}
		
		public override function getDescription(target:Creature):String
		{
			var matchingRightTattoo:Boolean;
			var matchingLeftTattoo:Boolean;
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "face": ret = "Sharp-edged, thick lines of ink run across your face from brow to chin, curving pointedly past your [pc.eyeColor] eyes. The " + this.color + " tribal patterns frame them, making them seem that much more distinct."; break;
				
				case "neck": ret = "Up either side of your neck, spikey-ended " + this.color + " markings line your [pc.skinFurScalesNoun]. They're like thorny branches of ink rising up from behind your shoulders, threatening to touch your cheeks."; break;
				
				case "upper back": ret = "Like " + this.color + " wings with jagged edges, your entire upper-back is covered in one huge interconnected tribal tattoo. With spiked parts pointing up at your neck and down your spine, it looks incredibly fierce, at least to those standing behind you."; break;
				
				case "lower back": ret = "Right above your rump is a " + this.color + " tribal tattoo that seems to almost rise and spread its wings from beneath your buttocks. In true tramp-stamp fashion, there's an intricate design right above the cleft."; break;
				
				case "left chest":
					matchingRightTattoo = target.hasRightChestTattooOfType(this.tattooType);//check if pc has same tattoo on other side
					if(target.hasBreasts()) ret = "Around your " + (matchingRightTattoo ? "breasts": "left breast" + (target.bRows() > 1 ? "s" : "")) + ", but not actually <i>on</i> " + (matchingRightTattoo || target.bRows() > 1 ? "them" : "it") + ", are flowing " + this.color + (matchingRightTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.rightChestTattoo.color : "") + " tribal tattoos. The crescent-like lines hug " + (matchingRightTattoo ? "them and look like a cupless, drawn-on bra, even running between your cleavage. It makes your boobs look " + (target.biggestTitSize() > 3 ? "even" : "much")  + " bigger, drawing attention to your [pc.skinColor] spheres" : "it, reminiscent of ancient amazonian warpaint") + ".";//TODO: determine already big size
					else ret = "You've got " + this.color + (matchingRightTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.rightChestTattoo.color : "") + " tribal tattoos running down from " + (matchingRightTattoo ? "both shoulderblades" : "one shoulderblade") + " and across " + (matchingRightTattoo ? "your pecs" : "a single pec") + ". The ever-narrowing and interlaced lines weave around your areola, making you look like an ancient and fierce warrior.";
				break;
				
				case "right chest":
					matchingLeftTattoo = target.hasLeftChestTattooOfType(this.tattooType);//check if pc has same tattoo on other side
					if(target.hasBreasts()) ret = "Around your " + (matchingLeftTattoo ? "breasts": "right breast" + (target.bRows() > 1 ? "s" : "")) + ", but not actually <i>on</i> " + (matchingLeftTattoo || target.bRows() > 1? "them" : "it") + ", are flowing " + this.color + (matchingLeftTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and" + target.leftChestTattoo.color : "") + " tribal tattoos. The crescent-like lines hug " + (matchingLeftTattoo ? "them and look like a cupless, drawn-on bra, even running between your cleavage. It makes your boobs look " + (target.biggestTitSize() > 3 ? "even" : "much")  + " bigger, drawing attention to your [pc.skinColor] spheres" : "it, reminiscent of ancient amazonian warpaint") + ".";//TODO: determine already big size
					else ret = "You've got " + this.color + (matchingLeftTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.leftChestTattoo.color : "") + " tribal tattoos running down from " + (matchingLeftTattoo ? "both shoulderblades" : "one shoulderblade") + " and across " + (matchingLeftTattoo ? "your pecs" : "a single pec") + ". The ever-narrowing and interlaced lines weave around your areola, making you look like an ancient and fierce warrior.";
				break;
				
				case "full chest":
					if(target.hasBreasts()) ret = "Around your breasts, but not actually <i>on</i> them, are flowing " + this.color + " tribal tattoos. The crescent-like lines hug them and look like a cupless, drawn-on bra, even running between your cleavage. It makes your boobs look " + (target.biggestTitSize() > 3 ? "even" : "much")  + " bigger, drawing attention to your [pc.skinColor] spheres.";//TODO: determine already big size
					else ret = "You've got " + this.color + " tribal tattoos running down from both shoulderblades and across your pecs. The ever-narrowing and interlaced lines weave around your areola, making you look like an ancient and fierce warrior.";
				break;
				
				case "left arm": 
					matchingRightTattoo = target.hasRightArmTattooOfType(this.tattooType);
					ret = "Wrapping around " + (matchingRightTattoo ? "both your arms" : "your left arm") + " are wild-looking tribal tattoos, inked in " + this.color + (matchingRightTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " and " + target.rightArmTattoo.color : "") + " thick lines. Knotted and interconnected, they wrap around, making you look like a primal warrior more than a [pc.class].";
				break;
				
				case "right arm":
					matchingLeftTattoo = target.hasLeftArmTattooOfType(this.tattooType);
					ret = "Wrapping around " + (matchingLeftTattoo ? "both your arms" : "your right arm") + " are wild-looking tribal tattoos, inked in " + this.color + (matchingLeftTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " and " + target.leftArmTattoo.color : "") + " thick lines. Knotted and interconnected, they wrap around, making you look like a primal warrior more than a [pc.class].";
				break;
				
				/*case "left leg"://TODO: single/more than 2 leg shenans?
					matchingRightTattoo = target.hasRightLegTattooOfType(this.tattooType);
					ret = "Coiling around your " + (matchingRightTattoo ? "legs" : "your left leg") + " are thorn-edged ink markings, " + this.color + (matchingRightTattoo && target.rightLegTattoo.color != target.leftLegTattoo.color ? ", " + target.rightLegTattoo.color : "") + " and dramatic. The tribal patterns reach all the way down to your " + (matchingRightTattoo ? "[pc.feet]" : "[pc.foot]") + ".";
				break;
				
				case "right leg"://TODO: single/more than 2 leg shenans?
					matchingLeftTattoo = target.hasLeftLegTattooOfType(this.tattooType);
					ret = "Coiling around your " + (matchingLeftTattoo ? "legs" : "your right leg") + " are thorn-edged ink markings, " + this.color + (matchingLeftTattoo && target.rightLegTattoo.color != target.leftLegTattoo.color ? ", " + target.leftLegTattoo.color : "") +  " and dramatic. The tribal patterns reach all the way down to your " + (matchingLeftTattoo ? "[pc.feet]" : "[pc.foot]") + ".";
				break;*/
				
				default: ret = ""; break;
			}
			
			return ret;
		}
	}
}