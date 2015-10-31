﻿package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.kGAMECLASS;
	
	public class EagleHandgun extends ItemSlotClass
	{
		//constructor
		public function EagleHandgun()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E.Handgun";
			
			//Regular name
			this.longName = "eagle handgun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an eagle handgun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A large barreled fifty caliber handgun. This particular pistol packs a wallop for such a compact weapon.";
			//if(kGAMECLASS.chars["PC"].characterClass == GLOBAL.CLASS_MERCENARY) this.tooltip += " It's the perfect weapon for a mercenary on the go.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			//Information
			this.basePrice = 420;
			this.attack = 0;
			
			baseDamage.kinetic.damageValue = 7;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
