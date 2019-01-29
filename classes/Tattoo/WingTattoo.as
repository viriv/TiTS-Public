package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	public class WingTattoo extends TattooClass
	{
		public function WingTattoo() 
		{
			this.tattooType = GLOBAL.TATTOO_FLORAL;
			
			addFlag(GLOBAL.TATTOO_FLAG_UPPER_BACK);
			addFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK);
		}
		
		public override function getDescription(target:Creature):String
		{
			var matchingRightTattoo:Boolean;
			var matchingLeftTattoo:Boolean;
			var ret:String = "";
			
			switch(this.tattooLocation)
			{
				case "upper back":
					switch(this.optionalTattooAttribute)
					{
						case "bat":
							ret = "A pair of " + this.color + ", tattooed bat wings spread out and across your entire back, the taloned tips touching your shoulder blades and sweeping downward.";
						break;
						
						case "feather":
							ret = "A pair of " + this.color + ", feathered wings are tattooed across your entire back, arching up to your shoulder blades and then sweeping downwards.";
						break;
						
						case "butterfly":
							ret = "A pair of " + this.color + ", butterfly wings are tattooed across your entire back.";
						break;
					}
				break;
				
				case "lower back":
					switch(this.optionalTattooAttribute)
					{
						case "bat":
							ret = "A small pair of " + this.color + " bat wings are tramp-stamped right above your buttocks, spreading outward horizontally and ending in talon spikes.";
						break;
						
						case "feather":
							ret = "A small pair of " + this.color + " feathered wings are tramp-stamped right above your buttocks, spreading outward horizontally.";
						break;
						
						case "butterfly":
							ret = "A small pair of " + this.color + "butterfly wings are tramp-stamped right above your buttocks, spreading outwards.";
						break;
					}
				break;
				
				default: ret = ""; break;
			}
			return ret;
		}
	}
}