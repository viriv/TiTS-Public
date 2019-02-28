package classes.Tattoo 
{
	import classes.Creature;
	import classes.TattooClass;
	import classes.GLOBAL;
	import flash.utils.getQualifiedClassName;
	public class SlutStampTattoo extends TattooClass
	{	
		public function SlutStampTattoo() 
		{
			this.color = "pink"
			this.tattooType = GLOBAL.TATTOO_SLUT_STAMP;
			this.tattooLocation = "lower back";
			
			addFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK);
		}
		
		public override function getDescription(target:Creature):String
		{
			var targetIsPC:Boolean = false;
			if(getQualifiedClassName(target) == "classes.Characters::PlayerCharacter") targetIsPC = true;
			return "To highlight " + (targetIsPC ? "your":"[target.hisHer]") + " vulgarity, a tattoo is permanently printed on " + (targetIsPC ? "your":"[target.hisHer]") + " lower back, advertising how much of a slut " + (targetIsPC ? "you are":"[target.heShe] is") + " to anyone who sees it.";
		}
		
		public override function onEquip(target:Creature):void
		{
			target.createPerk("Slut Stamp", 10, 10, 10, 0, "A tattoo permanently emblazoned above your ass makes you horny faster while wearing anything clothing your lower body.");
		}
		
		public override function onRemove(target:Creature):void
		{
			target.removePerk("Slut Stamp");
		}
	}
}