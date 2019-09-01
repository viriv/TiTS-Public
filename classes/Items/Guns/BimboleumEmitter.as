package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class BimboleumEmitter extends ItemSlotClass
	{
		//Level 8 (Rare). Balance 2.0
		public function BimboleumEmitter()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "B.Emitter";
			longName = "Bimboleum Emitter";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Bimboleum Emitter";
			tooltip = "A custom designed Bimboleum Emitter, like the kind Doctor Badger uses.\n\nMay cause fantasies, enflamed genitalia, inflated genitalia, orgasm, mild euphoria, severe euphoria, temporary loss of intelligence, permanent loss of intelligence, spontaneous silicone synthesis, drooling, undue vaginal secretions, sudden onset of fetishes, attention deficit disorder, high blood pressure, or cardiac arrest. Effects are generally temporary unless exposure is long term.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "bimbofication";
			
			basePrice = 22000;
			
			baseDamage.tease.damageValue = 8;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 3;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
