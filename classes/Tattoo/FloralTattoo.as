package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	public class FloralTattoo extends TattooClass
	{
		public function FloralTattoo() 
		{
			this.tattooType = GLOBAL.TATTOO_FLORAL;
			
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
			addFlag(GLOBAL.TATTOO_FLAG_LEFT_BUTT);
			addFlag(GLOBAL.TATTOO_FLAG_RIGHT_BUTT);
			addFlag(GLOBAL.TATTOO_FLAG_FULL_BUTT);
			addFlag(GLOBAL.TATTOO_FLAG_ABOVE_CROTCH);
		}
		
		public override function getDescription(target:Creature):String
		{
			var matchingRightTattoo:Boolean;
			var matchingLeftTattoo:Boolean;
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "face": ret = "Across your [pc.skinColor] cheeks, " + this.color + " flowers are blooming, giving you a distinctly sylvan countenance. Not only your look, but the feel and smell of your cheeks are blossom-like."; break;
				
				case "neck": ret = "Like they're growing on a scaffold, floral tattoos decorate your neck, each one blooming a brilliant " + this.color + ". They follow the curves of your neck, making for an impressively seamless display."; break;
				
				case "upper back": ret = "A thick floral stem runs up your back, branching out across your shoulder blades. From each branch, large " + this.color + " blossoms form, covering your [pc.skinFurScales] in an efflorescent expanse."; break;
				
				case "lower back": ret = "A large blossom marks the base of your spine, just above your rump. From beneath the " + this.color + " petals, stems horizontally shoot out, and are connected to smaller sprouting flowers."; break;
				
				case "left chest"://doc didn't have a L/R floral pattern on flat chests so some got made up
					matchingRightTattoo = target.hasRightChestTattooOfType(this.tattooType);
					if(target.hasBreasts()) ret = "Petals rise up from beneath your " + (matchingRightTattoo ? "breasts" : "left breast") + ", wrapping " + (matchingRightTattoo ? "your bust" : "it") + " in a " + this.color + (matchingRightTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.rightChestTattoo.color : "") + " floral bloom. " + (matchingRightTattoo ? "Blossoms burst" : "A blossom bursts") + " out and sensuously display" + (matchingRightTattoo ? "s" : "") + " your [pc.nippleColor] areola" + (matchingRightTattoo ? "e" : "") + ", your " + (matchingRightTattoo ? "[pc.nipplesNoun]" : "[pc.nippleNoun]") + " in the center.";
					else ret = "Petals and leaves cover " + (matchingRightTattoo ? "your entire" : " the left half of your") + " chest, linked by organic stems and roots. The flowers are " + this.color + (matchingRightTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.rightChestTattoo.color: "") + ", gene-modded onto your [pc.skinColor] [pc.skinFurScalesNoun]. The mods makes your chest soft to the touch and deliciously scented.";
				break;
				
				case "right chest"://doc didn't have a L/R floral pattern on flat chests so some got made up
					matchingLeftTattoo = target.hasLeftChestTattooOfType(this.tattooType);
					if(target.hasBreasts()) ret = "Petals rise up from beneath your " + (matchingLeftTattoo ? "breasts" : "right breast") + ", wrapping " + (matchingLeftTattoo ? "your bust" : "it") + " in a " + this.color + (matchingLeftTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.leftChestTattoo.color : "") + " floral bloom. " + (matchingLeftTattoo ? "Blossoms burst" : "A blossom bursts") + " out and sensuously display" + (matchingLeftTattoo ? "s" : "") + " your [pc.nippleColor] areola" + (matchingLeftTattoo ? "e" : "") + ", your " + (matchingLeftTattoo ? "[pc.nipplesNoun]" : "[pc.nippleNoun]") + " in the center.";
					else ret = "Petals and leaves cover " + (matchingLeftTattoo ? "your entire" : " the right half of your") + " chest, linked by organic stems and roots. The flowers are " + this.color + (matchingLeftTattoo && target.rightChestTattoo.color != target.leftChestTattoo.color ? " and " + target.leftChestTattoo.color: "") + ", gene-modded onto your [pc.skinColor] [pc.skinFurScalesNoun]. The mods makes your chest soft to the touch and deliciously scented.";
				break;
				
				case "full chest":
					if(target.hasBreasts()) ret = "Petals rise up from beneath your breasts, wrapping your bust in a " + this.color + " floral bloom. blossoms burst out and sensuously displays your [pc.nippleColor] areolae, your [pc.nipplesNoun] in the center.";
					else ret = "Petals and leaves cover your entire chest, linked by organic stems and roots. The flowers are " + this.color + ", gene-modded onto your [pc.skinColor] [pc.skinFurScalesNoun]. The mods makes your chest soft to the touch and deliciously scented.";
				break;
				
				case "left arm": 
					matchingRightTattoo = target.hasRightArmTattooOfType(this.tattooType);
					ret = "Wrapping around " + (matchingRightTattoo ? "both your arms" : "your left arm") + "  are vines and flowers, each blossoming in " + this.color + (matchingRightTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " or " + target.rightArmTattoo.color : "") + ".";
				break;
				
				case "right arm": 
					matchingLeftTattoo = target.hasLeftArmTattooOfType(this.tattooType);
					ret = "Wrapping around " + (matchingLeftTattoo ? "both your arms" : "your right arm") + "  are vines and flowers, each blossoming in " + this.color + (matchingLeftTattoo && target.rightArmTattoo.color != target.leftArmTattoo.color ? " or " + target.leftArmTattoo.color : "") + ".";
				break;
				
				case "left leg"://TODO: single/more than 2 leg shenans?
					matchingRightTattoo = target.hasRightLegTattooOfType(this.tattooType);
					ret = "Running up and around your " + (matchingRightTattoo ? "legs" : "your left leg") + " are flower-like markings. They're literally part of your [pc.skinFurScalesNoun].";//no mention of tattoo color in docs
				break;
				
				case "right leg"://TODO: single/more than 2 leg shenans?
					matchingLeftTattoo = target.hasLeftLegTattooOfType(this.tattooType);
					ret = "Running up and around your " + (matchingLeftTattoo ? "legs" : "your right leg") + " are flower-like markings. They're literally part of your [pc.skinFurScalesNoun].";//no mention of tattoo color in docs
				break;
				
				case "left buttock":
					matchingRightTattoo = target.hasRightButtTattooOfType(this.tattooType);
					ret = "Your " + (matchingRightTattoo ? "buttocks are" : "left buttock is") + " covered in " + this.color + (matchingRightTattoo && target.rightButtTattoo.color != target.leftButtTattoo.color ? " and " + target.rightButtTattoo.color : "") + "  flowers. Whenever someone glimpses at your butt, they get a floral display!"
				break;
				
				case "right buttock":
					matchingLeftTattoo = target.hasLeftButtTattooOfType(this.tattooType);
					ret = "Your " + (matchingLeftTattoo ? "buttocks are" : "right buttock is") + " covered in " + this.color + (matchingLeftTattoo && target.rightButtTattoo.color != target.leftButtTattoo.color ? " and " + target.leftButtTattoo.color : "") + " flowers. Whenever someone glimpses at your butt, they get a floral display!"
				break;
				
				case "full butt": ret = "Your buttocks are covered in " + this.color + " flowers. Whenever someone glimpses at your butt, they get a floral display!"; break;
				
				case "crotch": ret = "Above your crotch and below your navel are flowery blooms, " + this.color + " and wild. When you stroke your belly down there, it feels petal soft, just like <i>real</i> flowers."; break;
				
				default: ret = ""; break;
			}
			
			return ret;
		}
	}
}