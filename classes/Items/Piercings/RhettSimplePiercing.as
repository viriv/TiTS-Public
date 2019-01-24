package classes.Items.Piercings 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class RhettSimplePiercing extends ItemSlotClass
	{
		public var color:String;//color of piercing
		public var piercingType:String;//ring/bar/stud
		
		public function RhettSimplePiercing(piercingType:String = "ring", color:String = "black") 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			this.color = color;
			this.piercingType = piercingType;
			
			this.shortName = StringUtil.capitalize(color.substring(0, 4)) + "." + StringUtil.capitalize(piercingType) + "P.";
			this.longName = color + " " + piercingType + " piercing";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a " + color + " " + piercingType;
			
			this.tooltip = "This " + color + " " + piercingType + " is a classic, purely ornamental choice. Like all modern piercings, it is self-piercing and guaranteed sanitary for multiple uses. It has no effect beyond enhancing your own personal style.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 100;
			
			switch(piercingType)
			{
				case "ring": addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING); break;
				case "bar": addFlag(GLOBAL.ITEM_FLAG_PIERCING_BAR); break;
				case "stud": addFlag(GLOBAL.ITEM_FLAG_PIERCING_STUD); break;
			}
			
			
			this.version = _latestVersion;
			this.hasRandomProperties = true;//keeps color piercingsType fields consistent between save/load/copying
			this.hasUniqueName = true;//keeps shortname consistent between save/load/copying
		}
	}
}