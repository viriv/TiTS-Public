package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	public class Rhett extends Creature
	{
		public function Rhett() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Rhett";
			originalRace = "half akhid";
			
			this.femininity = 0;
			this.genitalSpot = 0;
			this.hipRatingRaw = 4;
			this.buttRatingRaw = 4;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].cThicknessRatioRaw = 1;
			this.balls = 2;
			this.cumMultiplierRaw = 10;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 4.5;
			this.ballFullness = 10;
			this.ballEfficiency = 30;
			this.refractoryRate = 5;
		}
	}
}