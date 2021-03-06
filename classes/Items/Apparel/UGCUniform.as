package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class UGCUniform extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		public function UGCUniform() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			this.shortName = "UGC Uniform";
			
			this.longName = "U.G.C. Peacekeeper uniform";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a standard issue U.G.C. Peacekeeper uniform";
			
			this.tooltip = "This is a standard issue U.G.C. Peacekeeper uniform, assigned to relevent members of the U.G.C Peacekeeper corps.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 220;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 2;
			this.fortification = 15;
			
			this.version = this._latestVersion;
		}
		
	}

}
