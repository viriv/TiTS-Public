package classes.Tattoo 
{
	import classes.TattooClass;
	import classes.GLOBAL;
	public class EmptyTattoo extends TattooClass
	{
		public function EmptyTattoo() 
		{
			this.color = "";
			this.tattooType = GLOBAL.NO_TATTOO;
			this.optionalTattooAttribute = "";
			this.tattooLocation = "";
			this.description = "";
		}
	}
}