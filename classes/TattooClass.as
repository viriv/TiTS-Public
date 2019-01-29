package classes 
{
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	public class TattooClass implements ISaveable
	{
		public var color:String = "";//color of tattoo
		public var tattooType:int = GLOBAL.NO_TATTOO;//style of tattoo art
		public var optionalTattooAttribute:String = "";//wing type/text/etc...
		public var tattooLocation:String = "";
		public var description:String = "";
		
		public var tattooFlags:Array = new Array();
		public var hasUniqueName:Boolean = false;
		public var hasRandomProperties:Boolean = false;
		
		public function TattooClass() 
		{
			
		}
		
		public function getDescription(target:Creature):String
		{
			return "";
		}
		
		public function addFlag(arg:int):void 
		{
			if(this.hasFlag(arg)) 
				return;
			this.tattooFlags[this.tattooFlags.length] = arg;
		}
		
		public function hasFlag(arg:int):Boolean 
		{
			for(var x:int = 0; x < tattooFlags.length; x++) {
				if(arg == tattooFlags[x]) 
					return true;
			}
			return false;
		}
		
		public function deleteFlag(arg:int):void 
		{
			if(!this.hasFlag(arg)) 
				return;
			for(var x:int = 0; x < this.tattooFlags.length; x++) 
			{
				if(arg == this.tattooFlags[x]) this.tattooFlags.splice(x,1);
			}
		}
		
		public function getSaveObject():Object
		{
			var newObj:Object = new Object();
			//TODO: this
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			
			/*if (this.hasRandomProperties == true)
			{
				for each (var prop:XML in _dl)
				{
					var propName:String = prop.@name.toString();*/
			
			newObj.classInstance = getQualifiedClassName(this);
			
			newObj.color = this.color;
			newObj.tattooType = this.tattooType;
			
			return newObj;
		}
		
		public function loadSaveObject(o:Object):void
		{
			this.color = o.color;
			this.tattooType = o.tattooType;
		}
		
		public function makeCopy():*
		{
			var ntc:TattooClass = new TattooClass();
			ntc.loadSaveObject(this.getSaveObject());
			return ntc;
		}
	}
}