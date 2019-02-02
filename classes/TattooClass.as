package classes 
{
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
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
		
		private function isBasicType(obj:*):Boolean
		{
			if (obj is int) return true;
			if (obj is Number) return true;
			if (obj is String) return true;
			if (obj is Boolean) return true;
			if (obj is uint) return true;
			return false;
		}
		
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			var i:int;
			//TODO: this
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			
			
			for each (var prop:XML in _dl)
			{
				var propName:String = prop.@name.toString();
				if (this[propName] != null && this[propName] != undefined)
				{
					if (this[propName] is ISaveable)
					{
						dataObject[propName] = this[propName].getSaveObject();
					}
					else if (this[propName] is Array)
					{
						if (this[propName].length > 0)
						{
							if (this[propName][0] is ISaveable)
							{
								dataObject[propName] = new Array();
								
								for (i = 0; i < this[propName].length; i++)
								{
									dataObject[propName].push(this[propName][i].getSaveObject());
								}
							}
							else if (isBasicType(this[propName][0]))
							{
								dataObject[propName] = new Array();
								
								for (i = 0; i < this[propName].length; i++)
								{
									dataObject[propName].push(this[propName][i]);
								}
							}
							else
							{
								dataObject[propName] = this[propName];
								trace("Potential serialization issue with property: " + propName);
							}
						}
						else
						{
							dataObject[propName] = new Array();
						}
					}
					else if (isBasicType(this[propName]))
					{
						dataObject[propName] = this[propName];
					}
					else
					{
						dataObject[propName] = this[propName];
						trace("Potential serialization issue with property: " + propName);
					}
				}
				for each (var accs:XML in _da)
				{
					var accsName:String = accs.@name.toString();
					dataObject[accsName] = this[accsName];
				}
			}
			
			dataObject.classInstance = getQualifiedClassName(this);
			
			return dataObject;
		}
		
		public function loadSaveObject(dataObject:Object):void
		{
			var prop:*;
			
			var _d:XML = describeType(dataObject);
			if (_d.@isDynamic == "true")
			{
				for (prop in dataObject)
				{
					if (!hasOwnProperty(prop)) continue;
					
					var tProp:String = prop;
					if (this[tProp] is ISaveable)
					{
						var classT:Class = getDefinitionByName(dataObject[tProp].classInstance) as Class;
						this[tProp] = new classT();
						this[tProp].loadSaveObject(dataObject[tProp]);
					}
					else
					{
						this[tProp] = dataObject[tProp];
					}
				}
			}
			else
			{
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (prop in _dl)
				{
					var propName:String = prop.@name.toString();
					if (this[propName] != null && this[propName] != undefined)
					{
						this[propName] = dataObject[propName];
					}
				}
				
				for each (var accs:* in _da)
				{
					var accsName:String = accs.@name.toString();
					if (accsName != "prototype" && accsName != "neverSerialize")
					{
						this[accsName] = dataObject[accsName];
					}
				}
			}
		}
		
		public function makeCopy():*
		{
			var ntc:TattooClass = new TattooClass();
			ntc.loadSaveObject(this.getSaveObject());
			return ntc;
		}
	}
}