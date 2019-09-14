import classes.Tattoo.DragonTattoo;
import classes.Tattoo.EmptyTattoo;
import classes.Tattoo.FloralTattoo;
import classes.Tattoo.SkullTattoo;
import classes.Tattoo.TribalTattoo;
import classes.Tattoo.WingTattoo;
import classes.Tattoo.TextTattoo;
import classes.Items.Piercings.RhettSimplePiercing;
import classes.Items.Miscellaneous.EmptySlot;
import classes.GLOBAL;
import classes.Engine.Utility.IncrementFlag;
import classes.TattooClass;
import classes.Items.Miscellaneous.SkySap;
//AUTHOR - JimThermic

//Piercing salon
public function kinkyInksIncBonusFunc():Boolean
{
	author("Jim T");
	
	output("This store is filled with floating holo-pictures, each of a different kind of skin mods or piercing. They line the walls in all directions. With the click of a button, the displays can scan you and show you a digital mockup of what the different body mods will look like on you.");
	output("\n\nThere's a long, sleek black counter with a totally tattooed out VI droid. However, it seems to just be there to do transactions. The real work appears to happen in the back room, through an archway with no door. There's a tattoo table slash seat, along with a ton of different skin-modding equipment.");
	
	addButton(0, flags["MET_RHETT"] == undefined ? "ShopKeep" : "Rhett", flags["MET_RHETT"] == undefined ? approachRhett : meetRhett);//unknown until talked to at least once
	return false;
}

//Extra interation on first meet
public function approachRhett():void
{
	clearOutput();
	author("Jim T");
	
	IncrementFlag("MET_RHETT");
	
	output("A shirtless, utterly tattooed man slithers towards you–slithers because his entire lower half seems to be entirely naga-like. His midnight serpent scales are lined with silver tribal tattoos, while his pale, humanoid torso is conversely covered in black wicked-looking ink. You get the impression he's staring at you, but it's hard to tell; the well-toned man is wearing a pair of mirrored shades, and he's stony-faced, making him hard to read.");
	output("\n\n<i>“... Here for some ink?”</i> he asks, whipping out a thin, white stick. He lights it up and no smoke comes out, though the end glows.");
	output("\n\n<i>“Ink? Don't tell me you actually paint people's bodies with ink here,”</i> you answer, then gesture to the object in his mouth. <i>“...And what's that?”</i>")
	output("\n\nThe tattooed, naga-like man grins. <i>“Nah. It's an old expression. Archaic, I know.”</i> He then plucks the pale stick from his mouth and lifting it with two fingers. <i>“... and it's nim leaf.”</i>");
	output("\n\n<i>“Don't worry, it's a UGC approved substance, and the nano-foil makes it smokeless.”</i>");
	output("\n\nYou nod. Gesturing to the displays, you ask if it's a skin modding store. Rhett gives the barest down and up tilt of his head.");
	output("\n\n<i>“... Yup. I'm a top-class skin modder,”</i> the half-man, half-serpent gestures to a Procyon-U medical degree behind the counter. <i>“The name's Rhett.”</i>");
	output("\n\n<i>“There's plenty of holos around. Just tell me if you want anything.”</i> And with that, Rhett leans against the counter, smoking his smokeless cigarette. He's... not much of a salesman. Maybe his work speaks for itself...?");
	
	if(!CodexManager.entryUnlocked("Akhid"))//add snake people codex entry if not met elsewhere yet
	{
		output("\n\nYour Codex bleeps on your arm. Looking down, you realise it has been updated with a species entry on the Akhid. Handy!");
		CodexManager.unlockEntry("Akhid");
	}
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", meetRhett);
}

//Standard Rhett meet
public function meetRhett():void
{
	clearOutput();
	author("Jim T");
	
	output("Rhett is leaning wordlessly against the counter. It's hard to tell what he's thinking with those mirrored shades and his stoic expression.");
	
	processTime(1);
	rhettMenu();
}

//Display shop menu
public function rhettMenu():void
{
	clearMenu();
	addButton(0, "Appearance", rhettAppearance, undefined, "Appearance", "Checkout the tattooed snakeman.");
	addButton(1, "Talk", rhettTalk, undefined, "Talk", "Talk with Rhett.");
	addButton(2, "Tattoos", rhettTattoos, undefined, "Tattoo", "Get a tattoo.");
	addButton(3, "Piercings", rhettPiercings, undefined, "Piercings", "Get a piercing.");
	if(pc.hasTattoo()) addButton(4, "TatRemoval", rhettTattoosRemovalPartSelection, undefined, "Removal", "Remove a tattoo.");
	else addDisabledButton(4, "TatRemoval", "TatRemoval", "You have no removable tattoos!")
	if(pc.lust() >= 33) addButton(5, "Sex", rhettSexMenu, undefined, "Sex", "Fuck the shopkeep.");
	else addDisabledButton(5, "Sex", "Sex", "You aren’t aroused enough for sex right now.");
	addButton(6, "Sky Sap", rhettSkySap, undefined, "Sky Sap", "Talk about Rhett's use for Sky Sap.");
	addButton(14, "Leave", mainGameMenu);
}

//Apperance
public function rhettAppearance():void
{
	clearOutput();
	author("Jim T");
	
	output("Rhett is a half-akhid, but <i>all</i> tattoo. His whole naga-like lower half–a shining expanse of black scales–is coated in silver, tribal like markings. Meanwhile, his well-toned, human-like upper half is conversely covered in black, wicked-looking ink.");
	output("\n\nHis black hair, barely an inch long, covers his scalp in a slight fuzz. The stoic-faced man is also rarely without his mirrored shades, making it even harder to read his expressions. In his lips is usually a white cigarette filled with harmless nim leaf, burning away smokelessly.");
	output("\n\nAlthough Rhett is essentially naked–since he refuses to wear a shirt on his toned upper half–his genitals are nowhere to be seen. He apparently <i>does</i> have them, they're just hidden behind his scales, protruding only when he's aroused. There's still a light fuzz of pubic hair on his human half and hanging above his crotch. ");
	
	clearMenu();
	addButton(0, "Next", meetRhett);
}

//Talk menu
public function rhettTalk():void
{
	clearOutput();
	author("Jim T");
	
	output("What did you want to talk about?");
	
	clearMenu();
	addButton(0, "Rhett", talkToRhettAboutRhett);
	addButton(1, "Store", talkToRhettAboutStore);
	addButton(2, "Species", talkToRhettAboutSpecies);
	addButton(3, "Nim Leaf", talkToRhettAboutNimLeaf);
	addButton(4, "Skin Mods", talkToRhettAboutSkinMods);
	addButton(14, "Back", meetRhett);
}

//Talk about snek's self
public function talkToRhettAboutRhett():void
{
	clearOutput();
	author("Jim T");
	
	output("You ask Rhett about himself, and the chiselled-faced man raises a dark eyebrow.");
	output("\n\n<i>“Not much to tell. Name's Rhett. I'm a skin modder. Pretty good one, I'm guessing, because customers keep coming back and telling me that.”</i>")
	output("\n\nHe's definitely looking at you, but he's not coughing up any more. You follow up with a second question; does he have any hobbies.");
	output("\n\n<i>“Sure.”</i>");
	output("\n\nAnd...that's it. That's the only answer he gives you. Talk about pulling teeth!");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", rhettTalk);
}

//Talk about snek's store
public function talkToRhettAboutStore():void
{
	clearOutput();
	author("Jim T");
	
	output("You ask Rhett about his store, and he looks around. A pause. Then he turns back to look at you... or you think he does. Hard to tell with those mirrored shades of his.");
	output("\n\n<i>“Bought it with credits I got from some side jobs. Edge of the rush seemed like a good place to set up shop. So far, it's worked out pretty well.”</i>");
	output("\n\nSo, does that mean the shop is pretty new, you ask? He nods, once.");
	output("\n\n<i>“Yup.”</i>");
	output("\n\nNo elaboration. Definitely not a big speaker.");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", rhettTalk);
}

//Talk about snek people
public function talkToRhettAboutSpecies():void
{
	clearOutput();
	author("Jim T");
	
	if(flags["MET_AKHID"] == undefined)//currently no other akhid in game to set this?
	{
		output("You ask him about what species he is, assuming it isn't the result of modding.");
		output("\n\n<i>“Nope. Born this way. Half-akhid,”</i> he answers, taking a drag from his smokeless cigarette.");
		IncrementFlag("MET_AKHID");
	}
	else
	{
		output("You ask him about his species. Was he modded to be half-akhid, or was he born that way? ");
		output("\n\n<i>“Born this way,”</i> he answers, taking a drag from his smokeless cigarette. ");
	}
	output("\n\nHe doesn't elaborate, so you probe once again.");
	output("\n\n<i>“Well, my father was akhid, my mother was human. She was a doctor, he was a miner. They hit it off, and here I am,”</i> he gruffly explains, <i>“Most akhid are more talkative than me. Didn't quite fit in on Caartha, so I came out here. After medschool, of course.”</i>");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", rhettTalk);
}

//Talk about snek's smoking
public function talkToRhettAboutNimLeaf():void
{
	clearOutput();
	author("Jim T");
	
	output("You ask him about the nimleaf he's smoking. He pulls it out from between his lips, lifting it between two fingers. <i>“... This? It's just nimleaf. Nothing special.”</i>");
	output("\n\n<i>“Synthetically grown leaf wrapped in nano-foil. When it burns, it doesn't release smoke, but a beneficial, nutrient-rich vapor. This one's caffeinated. Terran invention, actually. I think they had some kind of other substance originally, before nim leaf.”</i>");
	output("\n\nYou recall out loud that it was tobacco, being Terran yourself. He nods and jabs a finger at you.");
	output("\n\n<i>“Yeah, that's the one. Guess people were too lazy to come up with new names for things, I suppose.”</i>");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", rhettTalk);
}

//Talk about snek's job
public function talkToRhettAboutSkinMods():void
{
	clearOutput();
	author("Jim T");
	
	output("You ask Rhett if he can tell you a bit about skin modding, and he nods.");
	output("\n\n<i>“Medical Science. Used to be people actually drew on or punctured each other with needles. Pretty hard to believe. Still, you get a few piercing purists or BDSM lovers doing things the old way.”</i>");
	output("\n\n<i>“Nowadays, we take a sample of your genes, then cook up a localized mod to spray directly on your skin, designed to only affect the dermis... goo, scales, what have you. That way we can even painlessly tattoo rahn without hassles.”</i>");
	output("\n\nYou ask if there's any other benefits. Rhett's eyes light up and he shows you his arm, running his hand along it. The artwork is sheened to perfection, like a painting.");
	output("\n\n<i>“Oh, tons. Unlike the old school tattoos, skin mods don't fade. They can be bioluminous, and –best part in my opinion–they can be made to <b>feel</b> and <b>smell</b> like whatever you're tattooing on.”</i>");
	output("\n\n<i>“Can't wait until they figure out taste, because I'd love to have a tattoo on the back of my hand that tastes like rocky road. I'd lick my hand more than a kaithrit with fluffy ears.”</i>");
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", rhettTalk);
}

//Ask to get a tattoo
public function rhettTattoos():void
{
	clearOutput();
	author("Jim T");
	
	output("You tell Rhett you'd like a tattoo. The half-akhid man puts out his cigarette and gives a little nod.");
	output("\n\n<i>“... What kind you after?”</i> he asks.");
	
	clearMenu();
	//tattooVars = [type, (optional attribute i.e. wing type/text), location, color]
	addButton(0, "Tribal", rhettTattoosBodyPartSelection, [new TribalTattoo(), undefined]);
	addButton(1, "Floral", rhettTattoosBodyPartSelection, [new FloralTattoo(), undefined]);
	addButton(2, "Skull", rhettTattoosBodyPartSelection, [new SkullTattoo(), undefined]);
	addButton(3, "Dragon", rhettTattoosBodyPartSelection, [new DragonTattoo(), undefined]);
	addButton(4, "Wings", rhettTattoosWingsOptions, [new WingTattoo()]);
	addButton(5, "Text", rhettTattoosTextOptions, [new TextTattoo()]);
	addButton(14, "Back", rhettFristChanceBackOut);
}

//Wing tattoo type selection
public function rhettTattoosWingsOptions(tattooVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“Wings, huh–what kind?”<\i>");
	
	clearMenu();
	//tattooVars = [type, (optional attribute i.e. wing type/text), location, color]
	addButton(0, "Bat", rhettTattoosBodyPartSelection, [tattooVars[0], "bat"]);
	addButton(1, "Feather", rhettTattoosBodyPartSelection, [tattooVars[0], "feather"]);
	addButton(2, "Butterfly", rhettTattoosBodyPartSelection, [tattooVars[0], "butterfly"]);
	addButton(14, "Back", rhettBackOut);
}

//Text tattoo text entry
public function rhettTattoosTextOptions(tattooVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>What do you want written?</i>")
	
	displayInput();
	userInterface.textInput.text = "";
	userInterface.textInput.maxChars = 33;
	
	clearMenu();
	addButton(0, "Next", rhettTattoosTextSanitation, [tattooVars[0]]);
	addButton(14, "Back", rhettBackOut);
	output("\n\n\n");
}

//Illegal character input check (just a copy of what is used for player name at character creation minus the check for cheats)
public function rhettTattoosHasIllegalInput(sText:String = ""):Boolean
{
	if(sText.indexOf(" ") == 0) return true;
	var illegalChar:Array = ["<", ">", "[", "]", "\\", "\/"];
	for(var i:int = 0; i < illegalChar.length; i++)
	{
		if(sText.indexOf(illegalChar[i]) != -1) return true;
	}
	
	return false;
}

//Check players put valid input in for the text of a text tattoo that won't mess up the game
public function rhettTattoosTextSanitation(tattooVars:Array):void
{
	if(userInterface.textInput.text == "")
	{
		rhettTattoosTextOptions(tattooVars)
		output("<b>You must input something.</b>");
		return;
	}
	
	if(rhettTattoosHasIllegalInput(userInterface.textInput.text)) {
		rhettTattoosTextOptions(tattooVars);
		output("<b>To prevent complications, please avoid using code (angle brackets, square brackets, front and back slashes, etc...) in the text.</b>");
		return;
	}
	
	removeInput();
	rhettTattoosBodyPartSelection([tattooVars[0], userInterface.textInput.text]);
}

//Tattoo body part selection
public function rhettTattoosBodyPartSelection(tattooVars:Array):void
{
	//this is run every time a button is added to the bar. It will move to the next avalible button slot and check if it's the back button slot.
	//If so it will move the index to the start of the next page of buttons and add another back button on this new page
	function btnInc():void
	{
		btnIdx++;
		if(btnIdx % 14 == 0)
		{
			addButton(btnIdx + 15, "Back", rhettBackOut);
			btnIdx++;
		}
	}
	var btnIdx:int = 0;
	clearOutput();
	author("Jim T");
	
	output("<i>“Alright. Where do you want it?”<\i>");
	
	clearMenu();
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_FACE))
	{
		if(!pc.hasFaceTattoo()) addButton(btnIdx, "Face", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "face"]);
		else addDisabledButton(btnIdx, "Face", "Face", "Rhett can't tattoo your face when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_NECK))
	{
		if(!pc.hasNeckTattoo()) addButton(btnIdx, "Neck", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "neck"]);
		else addDisabledButton(btnIdx, "Neck", "Neck", "Rhett can't tattoo your neck when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_UPPER_BACK))
	{
		if(!pc.hasUpperBackTattoo()) addButton(btnIdx, "Upper Back", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "upper back"]);
		else addDisabledButton(btnIdx, "Upper Back", "Upper Back", "Rhett can't tattoo your upper back when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_LOWER_BACK))
	{
		if(pc.hasLowerBackTattooOfType(GLOBAL.TATTOO_SLUT_STAMP)) addDisabledButton(btnIdx, "Lower Back", "Lower Back", "Sera's slut stamp is already here!");
		else if(!pc.hasLowerBackTattoo()) addButton(btnIdx, "Lower Back", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "lower back"]);
		else addDisabledButton(btnIdx, "Lower Back", "Lower Back", "Rhett can't tattoo your lower back when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_LEFT_CHEST))
	{
		if(!pc.hasLeftChestTattoo() && !pc.hasFullChestTattoo()) addButton(btnIdx, "Left Chest", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "left chest"]);
		else addDisabledButton(btnIdx, "Left Chest", "Left Chest", "Rhett can't tattoo your left chest when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_RIGHT_CHEST))
	{
		if(!pc.hasRightChestTattoo() && !pc.hasFullChestTattoo()) addButton(btnIdx, "Right Chest", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "right chest"]);
		else addDisabledButton(btnIdx, "Right Chest", "Right Chest", "Rhett can't tattoo your right chest when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_FULL_CHEST))
	{
		if(!pc.hasChestTattoo()) addButton(btnIdx, "Full Chest", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "full chest"]);
		else addDisabledButton(btnIdx, "Full Chest", "Full Chest", "Rhett can't tattoo your full chest when it already has a tattoo!")
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_LEFT_ARM))
	{
		if(!pc.hasLeftArmTattoo()) addButton(btnIdx, "Left Arm", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "left arm"]);
		else addDisabledButton(btnIdx, "Left Arm", "Left Arm", "Rhett can't tattoo your left arm when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_RIGHT_ARM))
	{
		if(!pc.hasRightArmTattoo()) addButton(btnIdx, "Right Arm", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "right arm"]);
		else addDisabledButton(btnIdx, "Right Arm", "Right Arm", "Rhett can't tattoo your right arm when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_LEFT_BUTT))
	{
		if(pc.hasLeftButtTattooOfType(GLOBAL.TATTOO_BARCODED)) addDisabledButton(btnIdx, "Left Buttock", "Left Buttock", "Belle's barcode is preventing Rhett from tattooing your butt!");//Seems like this should block off butt tattoos
		else if(!pc.hasLeftButtTattoo() && !pc.hasFullButtTattoo()) addButton(btnIdx, "Left Buttock", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "left buttock"]);
		else addDisabledButton(btnIdx, "Left Buttock", "Left Buttock", "Rhett can't tattoo your left buttock when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_RIGHT_BUTT))
	{
		if(!pc.hasRightButtTattoo() && !pc.hasFullButtTattoo()) addButton(btnIdx, "Right Buttock", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "right buttock"]);
		else addDisabledButton(btnIdx, "Right Buttock", "Right Buttock", "Rhett can't tattoo your right buttock when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_FULL_BUTT))
	{
		if(pc.hasFullButtTattooOfType(GLOBAL.TATTOO_BARCODED)) addDisabledButton(btnIdx, "Full Butt", "Full Butt", "Belle's barcode is preventing Rhett from tattooing your butt!");//Seems like this should block off butt tattoos though not sure if it should be left/right/full so just assuming all get blocked when barcoded for now TODO:Make barcode an actual tattoo and have belle scenes remove/replace tattoos with barcode
		else if(!pc.hasButtTattoo()) addButton(btnIdx, "Full Butt", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "full butt"]);//disallow left right and full tattoos even if left+right = full because colors can be different on left and right and merging them causes a mix up
		else addDisabledButton(btnIdx, "Full Butt", "Full Butt", "Rhett can't tattoo your full butt when it already has a tattoo!");
		btnInc();
	}
	
	if(tattooVars[0].hasFlag(GLOBAL.TATTOO_FLAG_ABOVE_CROTCH))
	{
		if(!pc.hasAboveCrotchTattoo()) addButton(btnIdx, "Above Crotch", rhettTattoosColorSelection, [tattooVars[0], tattooVars[1], "crotch"]);
		else addDisabledButton(btnIdx, "Above Crotch", "Above Crotch", "Rhett can't tattoo your above crotch when it already has a tattoo!");
		btnInc();
	}
	
	addButton(14, "Back", rhettBackOut);
}

//Tattoo color selection
public function rhettTattoosColorSelection(tattooVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“... And the color?”<\i>");
	
	clearMenu();
	//tattooVars = [type, (optional attribute i.e. wing type/text), location, color]
	addButton(0, "Black", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "black"]);
	addButton(1, "White", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "white"]);
	addButton(2, "Silver", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "silver"]);
	addButton(3, "Copper", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "copper"]);
	addButton(4, "Gold", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "gold"]);
	addButton(5, "Red", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "red"]);
	addButton(6, "Blue", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "blue"]);
	addButton(7, "Green", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "green"]);
	addButton(8, "Orange", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "orange"]);
	addButton(9, "Yellow", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "yellow"]);
	addButton(10, "Purple", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "purple"]);
	addButton(11, "Pink", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "pink"]);
	addButton(14, "Back", rhettBackOut);
	
	if(flags["RHETT_LUMINOUS_TATTOOS"] != undefined)
	{
		addButton(12, "Lum. Violet", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous violet"]);
		addButton(13, "Lum. Purple", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous purple"]);
		addButton(15, "Lum. Blue", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous blue"]);
		addButton(16, "Lum. Pink", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous pink"]);
		addButton(17, "Lum. Orange", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous orange"]);
		addButton(18, "Lum. Green", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous green"]);
		addButton(19, "Lum. Silver", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "luminous silver"]);
		addButton(20, "Glowing Gold", rhettTattoosPayment, [tattooVars[0], tattooVars[1], tattooVars[2], "glowing gold"]);
		addButton(29, "Back", rhettBackOut);
	}
}

//Confirm payment
public function rhettTattoosPayment(tattooVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“That'll be 100 credits,”</i> Rhett announces, gesturing to the tattooed android manning the counter. <i>“Just give it to him, and we'll get started.”</i>");
	
	clearMenu();
	addButton(0, "Pay", rhettTattoosOuch, tattooVars);
	addButton(1, "Don't", rhettBackOut);
}

//Tattooing scene
public function rhettTattoosOuch(tattooVars:Array):void
{
	clearOutput();
	author("Jim T");
	//tattooVars = [type, (optional attribute), location, color]
	tattooVars[0].optionalTattooAttribute = tattooVars[1];
	tattooVars[0].tattooLocation = tattooVars[2];
	tattooVars[0].color = tattooVars[3];
	pc.addTattoo(tattooVars[0]);
	
	
	output("After you transfer the credits, you follow Rhett into his parlor in the back. ");
	
	if(flags["RHETT_HAS_WORKED_ON_BEFORE"] == undefined)
	{
		output("It's surprisingly sterile and white, with plenty of medical science devices. There's an expensive looking centrifuge and a large steel-lined fridge labelled 'Medical Materials'. In the center is a sleek looking tattooist's chair, which ");
		
		if(pc.isTaur())
		{
			output("morphs suddenly to be taur-friendly. He then instructs you to get on it.");
		}
		else output("you're  instructed to sit down in.");
	}
	else
	{
		output("You sit down in the familiar, sleek tattooist's chair");
		
		if(pc.isTaur()) output("–after it's morphed to be taur friendly, of course");
		output(".");
	}
	
	output("\n\nRhett shifts up to you and takes a genetic sample from you, then throws it up on holo-display. Silently, he begins typing away, working on the proper composition of skin-mod formulae to give you. His eyes are intensely locked on the screen, and his fingers light up the air at a lightning pace.")
	output("\n\n<i>“... Got the measurements. Should be a few minutes as the batch cooks up,”</i> he bluntly informs you. You sit and wait until one of his machines dispenses several small canisters. The skin-modder picks one out from the pack and inserts it into a pearly-looking gun. Pointing it at your [pc.skinFurScalesNoun], he pulls the trigger, and you're being hit with a small, pinpoint stream, like an air jet. He traces around the region, every so often stopping to switch canisters.");
	output("\n\nSuddenly, the half-akhid man stops, looking at his holo-watch. <i>“... Should be a minute more,”</i> he states. He's dead on. Sixty seconds later, you feel the sprayed area begin to warm, followed by a prickling sensation. Rhett checks the area, then pulls out a mirror to show you your new ink.");
	output("\n\n<i>“Complete success. ");
	
	if(flags["RHETT_HAS_WORKED_ON_BEFORE"] == undefined)
	{
		output("You're pretty easy to skin graft for. It's like your body just soaks in the mods.”</i>");
		IncrementFlag("RHETT_HAS_WORKED_ON_BEFORE");
	}
	else output("As usual, your body just soaks up the mods. You're an easy client.”</i>");
	
	output("\n\n<b>You now have a new tattoo on your " + tattooVars[2] +"!</b>");
	
	pc.credits -= 100;
	processTime(5);
	clearMenu();
	addButton(0, "Next", meetRhett);
}

//Tattoo removal
public function rhettTattoosRemovalPartSelection():void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“Alright. Where's the tattoo?”</i>");
	
	clearMenu();
	
	if (pc.hasFaceTattoo()) addButton(0, "Face", rhettTattoosRemovalPayment, pc.faceTattoo);
	else addDisabledButton(0, "Face", "Face", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasNeckTattoo()) addButton(1, "Neck", rhettTattoosRemovalPayment, pc.neckTattoo);
	else addDisabledButton(1, "Neck", "Neck", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasUpperBackTattoo()) addButton(2, "Upper Back", rhettTattoosRemovalPayment, pc.upperBackTattoo);
	else addDisabledButton(2, "Upper Back", "Upper Back", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasLowerBackTattoo()) addButton(3, "Lower Back", rhettTattoosRemovalPayment, pc.lowerBackTattoo);
	else addDisabledButton(3, "Lower Back", "Lower Back", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasLeftChestTattoo()) addButton(4, "Left Chest", rhettTattoosRemovalPayment, pc.leftChestTattoo);
	else addDisabledButton(4, "Left Chest", "Left Chest", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasRightChestTattoo()) addButton(5, "Right Chest", rhettTattoosRemovalPayment, pc.rightChestTattoo);
	else addDisabledButton(5, "Right Chest", "Right Chest", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasFullChestTattoo()) addButton(6, "Full Chest", rhettTattoosRemovalPayment, pc.fullChestTattoo);
	else addDisabledButton(6, "Full Chest", "Full Chest", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasLeftArmTattoo()) addButton(7, "Left Arm", rhettTattoosRemovalPayment, pc.leftArmTattoo);
	else addDisabledButton(7, "Left Arm", "Left Arm", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasRightArmTattoo()) addButton(8, "Right Arm", rhettTattoosRemovalPayment, pc.rightArmTattoo);
	else addDisabledButton(8, "Right Arm", "Right Arm", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasLeftButtTattoo()) addButton(9, "Left Buttock", rhettTattoosRemovalPayment, pc.leftButtTattoo);
	else addDisabledButton(9, "Left Buttock", "Left Buttock", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasRightButtTattoo()) addButton(10, "Right Buttock", rhettTattoosRemovalPayment, pc.rightButtTattoo);
	else addDisabledButton(10, "Right Buttock", "Right Buttock", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasFullButtTattoo()) addButton(11, "Full Butt", rhettTattoosRemovalPayment, pc.fullButtTattoo);
	else addDisabledButton(11, "Full Butt", "Full Butt", "There's no tattoo here that Rhett can remove!");
	
	if(pc.hasAboveCrotchTattoo()) addButton(12, "Above Crotch", rhettTattoosRemovalPayment, "above crotch");
	else addDisabledButton(12, "Above Crotch", "Above Crotch", "There's no tattoo here that Rhett can remove!");
	
	addButton(14, "Back", rhettBackOut);
}

//Confirm removal payment
public function rhettTattoosRemovalPayment(location:TattooClass):void
{
	clearOutput();
	author("Jim T");
	
	if(!location.hasFlag(GLOBAL.TATTOO_FLAG_RHETT_TATTOO)) output("<b>THIS ISN'T A TATTOO YOU CAN BUY BACK SO YOU PROBABLY CAN'T GET THIS TATTOO AGAIN AFTER REMOVAL!!!</b>\n\n");
	
	output("<i>“That'll be 50 credits,”</i> Rhett announces, gesturing to the tattooed android manning the counter. <i>“Just give it to him, and we'll get started.”</i>");
	
	clearMenu();
	
	addButton(0, "Pay", rhettTattoosRemoval, location);
	addButton(1, "Don't", rhettBackOut);
}

//Removal Scene
public function rhettTattoosRemoval(location:TattooClass):void
{
	clearOutput();
	author("Jim T");
	
	output("After you transfer the credits, you follow Rhett into his parlor in the back. ");
	
	if(flags["RHETT_HAS_WORKED_ON_BEFORE"] == undefined)
	{
		output("It's surprisingly sterile and white, with plenty of medical science devices. There's an expensive looking centrifuge and a large steel-lined fridge labelled 'Medical Materials'. In the center is a sleek looking tattooist's chair, ");
		if(pc.isTaur()) output("which morphs suddenly to be taur - friendly. He then instructs you to get on it.");
		else output("which you're instructed to sit down in.");
	}
	else
	{
		output("You sit down in the familiar, sleek tattooist's chair");
		if(pc.isTaur()) output("—after it's morphed to be taur friendly, of course");
	}
	output(".");
	output("\n\nRhett shifts up to you and takes a genetic sample from you, then throws it up on holo-display. Silently, he begins typing away, working on the proper composition of skin-mod formula to give you. His eyes are intensely locked on the screen, and his fingers light up the air at a lightning pace.");
	output("\n\n<i>“... Got the measurements. Should be a few minutes as the batch cooks up,”</i> he bluntly informs you. You sit and wait until one of his machines dispenses a single canister. The skin-modder picks one out from the pack and inserts it into a pearly-looking gun. Pointing it at your [pc.skinFurScalesNoun], he pulls the trigger, and you're being hit with a small, pinpoint stream, like an air jet.");
	output("\n\n<i>“Done. Just give it a moment,”</i> he states. The tattoo slowly disappears, your [pc.skinFurScalesNoun] returning to normal. <i>“... No fuss. ");
	
	if(flags["RHETT_HAS_WORKED_ON_BEFORE"] == undefined)
	{
		output("Wow, your body is pretty mod happy");
		IncrementFlag("RHETT_HAS_WORKED_ON_BEFORE");
	}
	else output("As usual, your body is pretty mod happy");
	output("”</i>.");
	
	pc.removeTattoo(location);
	
	output("\n\n<b>Your tattoo is now removed!</b>");
	
	pc.credits -= 50;
	processTime(5);
	clearMenu();
	addButton(0, "Next", meetRhett);
}

//Ask to get a piercing
public function rhettPiercings():void
{
	clearOutput();
	author("Jim T");
	
	output("You tell Rhett you'd like a piercing. The half-akhid man puts out his cigarette and gives a little nod.");
	output("\n\n<i>“... What kind you after?”</i> he asks.");
	
	clearMenu();
	//create array of vars describing piercing(type, color, placement, (placementIndex)) that gets passed along as args for final piecing scene
	//placementIndex is for when pcs have multiple of a part that can be pierced pc.bRow[0], pc.cocks[3], etc...
	addButton(0, "Ring", rhettPiercingsColorSelection, ["ring"]);
	addButton(1, "Stud", rhettPiercingsColorSelection, ["stud"]);
	addButton(2, "Bar", rhettPiercingsColorSelection, ["bar"]);
	addButton(14, "Back", rhettFristChanceBackOut);
}

//Select piercing color
public function rhettPiercingsColorSelection(piercingVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“What color piercing where you thinking of getting? We've got these kinds in stock.”</i>");
	
	clearMenu();
	addButton(0, "Black", rhettPiercingsBodySelection, [piercingVars[0], "black"]);
	addButton(1, "White", rhettPiercingsBodySelection, [piercingVars[0], "white"]);
	addButton(2, "Silver", rhettPiercingsBodySelection, [piercingVars[0], "silver"]);
	addButton(3, "Copper", rhettPiercingsBodySelection, [piercingVars[0], "copper"]);
	addButton(4, "Gold", rhettPiercingsBodySelection, [piercingVars[0], "gold"]);
	addButton(5, "Red", rhettPiercingsBodySelection, [piercingVars[0], "red"]);
	addButton(6, "Blue", rhettPiercingsBodySelection, [piercingVars[0], "blue"]);
	addButton(7, "Green", rhettPiercingsBodySelection, [piercingVars[0], "green"]);
	addButton(8, "Orange", rhettPiercingsBodySelection, [piercingVars[0], "orange"]);
	addButton(9, "Yellow", rhettPiercingsBodySelection, [piercingVars[0], "yellow"]);
	addButton(10, "Purple", rhettPiercingsBodySelection, [piercingVars[0], "purple"]);
	addButton(11, "Pink", rhettPiercingsBodySelection, [piercingVars[0], "pink"]);
	addButton(14, "Back", rhettBackOut);
}

//Select where to put piercing
public function rhettPiercingsBodySelection(piercingVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“What part you looking at getting pierced?”</i>");
	
	clearMenu();
	switch(piercingVars[0])
	{
		case "ring": rhettRingPiercingsMenu(piercingVars); break;
		case "stud": rhettStudPiercingsMenu(piercingVars); break;
		case "bar": rhettBarPiercingsMenu(piercingVars); break;
	}
	addButton(14, "Back", rhettBackOut);
}

//Generate avaliable button options for ring piercing
public function rhettRingPiercingsMenu(piercingVars:Array):void
{
	if(pc.earPiercing is EmptySlot) addButton(0, "Ears", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "ears"]);
	else addDisabledButton(0, "Ears", "Ears", "Rhett can't pierce your ears when they already have a piercing in them!");
	
	addDisabledButton(1, "Eyebrow", "Eyebrow", "Rhett can't do eyebrow ring piercings.");
	
	if(pc.nosePiercing is EmptySlot) addButton(2, "Nose", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "nose"]);
	else addDisabledButton(2, "Nose", "Nose", "Rhett can't pierce your nose when it already has a piercing in it!");
	
	if(pc.lipPiercing is EmptySlot) addButton(3, "Lip", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "lip"]);
	else addDisabledButton(3, "Lip", "Lip", "Rhett can't pierce your lip when it already had a piercing in it!");
	
	if(pc.bellyPiercing is EmptySlot) addButton(4, "Belly", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "belly"]);
	else addDisabledButton(4, "Belly", "Belly", "Rhett can't pierce your belly when it already has a piercing in it!");
	
	addDisabledButton(5, "Tongue", "Tongue", "Rhett can't do tongue ring piercings.");
	
	if(!pc.hasPiercedEveryNipple()) addButton(6, "Nipples", rhettPiercingsBRowSelection, [piercingVars[0], piercingVars[1], "nipples"]);
	else if(!pc.hasNipples()) addDisabledButton(6, "Nipples", "Nipples", "You don't have any nipples to pierce!");
	else addDisabledButton(6, "Nipples", "Nipples", "Rhett can't pierce your nipples when they are" + (pc.bRows() > 1 ? " all" : "") + " already pierced!");
	
	if(!pc.hasPiercedEveryCock()) addButton(7, "Cock", rhettPiercingsCockSelection, [piercingVars[0], piercingVars[1], "cock"]);
	else if(!pc.hasCock()) addDisabledButton(7, "Cock", "Cock", "You don't have a cock to pierce!");
	else addDisabledButton(7, "Cock", "Cock", "Rhett can't pierce your" + (pc.hasCocks() ? " cocks when they are all" : " cock when it's") + " already pierced!");
	
	if(!pc.hasPiercedEveryVagina()) addButton(8, "Vagina", rhettPiercingsVaginaSelection, [piercingVars[0], piercingVars[1], "vagina"]);
	else if(!pc.hasVagina()) addDisabledButton(8, "Vagina", "Vagina", "You don't have a vagina to pierce!");
	else addDisabledButton(8, "Vagina", "Vagina", "Rhett can't pierce your" + (pc.hasVaginas() ? " vaginas when they are all" : " vagina when it's") + " already pierced!");
	
	if(!pc.hasPiercedEveryClit()) addButton(9, "Clit", rhettPiercingsClitVaginaSelection, [piercingVars[0], piercingVars[1], "clit"]);
	else if(!pc.hasVagina()) addDisabledButton(9, "Clit", "Clit", "You don't have a clit to pierce!");
	else addDisabledButton(9, "Clit", "Clit", "Rhett can't pierce your" + (pc.hasVaginas() ? " clits when they are all" : " clit when it's") + " already pierced!");
}

//Generate avaliable button options for stud piercing
public function rhettStudPiercingsMenu(piercingVars:Array):void
{
	if(pc.earPiercing is EmptySlot) addButton(0, "Ears", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "ears"]);
	else addDisabledButton(0, "Ears", "Ears", "Rhett can't pierce your ears when they already have a piercing in them!");
	
	addDisabledButton(1, "Eyebrow", "Eyebrow", "Rhett can't do eyebrow stud piercings.");
	
	if(pc.nosePiercing is EmptySlot) addButton(2, "Nose", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "nose"]);
	else addDisabledButton(2, "Nose", "Nose", "Rhett can't pierce your nose when it already has a piercing in it!");
	
	if(pc.lipPiercing is EmptySlot) addButton(3, "Lip", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "lip"]);
	else addDisabledButton(3, "Lip", "Lip", "Rhett can't pierce your lip when it already had a piercing in it!");
	
	if(pc.bellyPiercing is EmptySlot) addButton(4, "Belly", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "belly"]);
	else addDisabledButton(4, "Belly", "Belly", "Rhett can't pierce your belly when it already has a piercing in it!");
	
	if(pc.tonguePiercing is EmptySlot) addButton(5, "Tongue", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "tongue"]);
	else addDisabledButton(5, "Tongue", "Tongue", "Rhett can't pierce your tongue when it already has a piercing in it!");
	
	addDisabledButton(6, "Nipples", "Nipples", "Rhett can't do nipple stud piercings.");
	
	if(!pc.hasPiercedEveryCock()) addButton(7, "Cock", rhettPiercingsCockSelection, [piercingVars[0], piercingVars[1], "cock"]);
	else if(!pc.hasCock()) addDisabledButton(7, "Cock", "Cock", "You don't have a cock to pierce!");
	else addDisabledButton(7, "Cock", "Cock", "Rhett can't pierce your" + (pc.hasCocks() ? " cocks when they are all" : " cock when it's") + " already pierced!");
	
	if(!pc.hasPiercedEveryVagina()) addButton(8, "Vagina", rhettPiercingsVaginaSelection, [piercingVars[0], piercingVars[1], "vagina"]);
	else if(!pc.hasVagina()) addDisabledButton(8, "Vagina", "Vagina", "You don't have a vagina to pierce!");
	else addDisabledButton(8, "Vagina", "Vagina", "Rhett can't pierce your" + (pc.hasVaginas() ? " vaginas when they are all" : " vagina when it's") + " already pierced!");
	
	if(!pc.hasPiercedEveryClit()) addButton(9, "Clit", rhettPiercingsClitVaginaSelection, [piercingVars[0], piercingVars[1], "clit"]);
	else if(!pc.hasClit()) addDisabledButton(9, "Clit", "Clit", "You don't have a clit to pierce!");
	else addDisabledButton(9, "Clit", "Clit", "Rhett can't pierce your" + (pc.hasVaginas() ? " clits when they are all" : " clit when it's") + " already pierced!");
}

//Generate avaliable button options for bar piercing
public function rhettBarPiercingsMenu(piercingVars:Array):void
{
	if(pc.earPiercing is EmptySlot) addButton(0, "Ears", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "ears"]);
	else addDisabledButton(0, "Ears", "Ears", "Rhett can't pierce your ears when they already have a piercing in them!");
	
	if(pc.eyebrowPiercing is EmptySlot) addButton(1, "Eyebrow", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], "eyebrow"]);
	else addDisabledButton(1, "Eyebrow", "Eyebrow", "Rhett can't pierce your eyebrow when it already has a piercing in it!");
	
	addDisabledButton(2, "Nose", "Nose", "Rhett can't do nose bar piercings.");
	addDisabledButton(3, "Lip", "Lip", "Rhett can't do lip bar piercings.");
	addDisabledButton(4, "Belly", "Belly", "Rhett can't do belly bar piercings.");
	addDisabledButton(5, "Tongue", "Tongue", "Rhett can't do tongue bar piercings");
	
	if(!pc.hasPiercedEveryNipple()) addButton(6, "Nipples", rhettPiercingsBRowSelection, [piercingVars[0], piercingVars[1], "nipples"]);
	else if(!pc.hasNipples()) addDisabledButton(6, "Nipples", "Nipples", "You don't have any nipples to pierce!");
	else addDisabledButton(6, "Nipples", "Nipples", "Rhett can't pierce your nipples when they are" + (pc.bRows() > 1 ? " all" : "") + " already pierced!");
	
	addDisabledButton(7, "Cock", "Cock", "Rhett can't do cock bar piercings.");
	addDisabledButton(8, "Vagina", "Vagina", "Rhett can't do vagina bar piercings");
	addDisabledButton(9, "Clit", "Clit", "Rhett can't do clit bar piercings");
}

//Check if player has more than one set of nipples
public function rhettPiercingsBRowSelection(piercingVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	if(pc.bRows() == 1) rhettPiercingsPayment([piercingVars[0], piercingVars[1], piercingVars[2], 0]);
	else
	{
		output("Select breast row to apply piercing to.");
		
		clearMenu();
		for(var i:int = 0; i < pc.bRows(); i++)
		{
			if(i % 15 == 0) addButton(i + 14, "Back", rhettBackOut)
			output("\n" + "<b>#" + (i + 1) + ":</b> " + "[pc.breastCupSize " + i + "] [pc.breasts " + i + "]");
			if(!pc.hasNipplePiercing(i)) addButton(i, "Row " + (i + 1) + " Nipples", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], piercingVars[2], i]);
			else addDisabledButton(i, "Row " + (i + 1), "Row " + (i + 1), "Rhett can't pierce this row since they are already pierced!");
		}
	}
}

//Check if player has more than one cock
public function rhettPiercingsCockSelection(piercingVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	if(pc.cocks.length == 1) rhettPiercingsPayment([piercingVars[0], piercingVars[1], piercingVars[2], 0]);
	else
	{
		output("Select cock to apply piercing to.");
		
		clearMenu();
		for(var i:int = 0; i < pc.totalCocks(); i++)
		{
			if(i % 15 == 0) addButton(i + 14, "Back", rhettBackOut)
			output("\n" + "<b>#" + (i + 1) + ":</b> " + "[pc.cockNounComplex " + i + "]");
			if(!pc.hasPiercedCocks(i)) addButton(i, "Cock " + (i + 1), rhettPiercingsPayment, [piercingVars[0], piercingVars[1], piercingVars[2], i]);
			else addDisabledButton(i, "Cock " + (i + 1), "Cock " + (i + 1), "Rhett can't pierce this cock since it is already pierced!");
		}
	}
}

//Check if player has more than one vagina
public function rhettPiercingsVaginaSelection(piercingVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	if(pc.vaginas.length == 1) rhettPiercingsPayment([piercingVars[0], piercingVars[1], piercingVars[2], 0]);
	else
	{
		output("Select vagina to apply piercing to.");
		
		clearMenu();
		for(var i:int = 0; i < pc.vaginas.length; i++)
		{
			if(i % 15 == 0) addButton(i + 14, "Back", rhettBackOut)
			output("\n" + "<b>#" + (i + 1) + ":</b> " + "[pc.vaginaNoun " + i + "]");
			if(pc.vaginas[i].piercing is EmptySlot) addButton(i, "Vagina " + (i + 1), rhettPiercingsPayment, [piercingVars[0], piercingVars[1], piercingVars[2], i]);
			else addDisabledButton(i, "Vagina " + (i + 1), "Vagina " + (i + 1), "Rhett can't pierce this vagina sicne it already is already pierced!");
		}
	}
}

//Check if player has more than one vagina therefore clit
public function rhettPiercingsClitVaginaSelection(piercingVars:Array):void
{
	//piercingVars = [type, color, placement, placementIndex]
	clearOutput();
	author("Jim T");
	
	if(pc.vaginas.length == 1) rhettPiercingsPayment([piercingVars[0], piercingVars[1], piercingVars[2], 0]);
	else
	{
		output("Select vagina to apply clit piercing to.");
		
		clearMenu();
		for(var i:int = 0; i < pc.vaginas.length; i++)
		{
			if(i % 15 == 0) addButton(i + 14, "Back", rhettBackOut)
			output("\n" + "<b>#" + (i + 1) + ":</b> " + "[pc.vaginaNoun " + i + "]");
			if( pc.vaginas[i].clitPiercing is EmptySlot) addButton(i, "Vagina " + (i + 1) + " Clit", rhettPiercingsPayment, [piercingVars[0], piercingVars[1], piercingVars[2], i]);
			else addDisabledButton(i, "Vagina " + (i + 1) + " clit", "Vagina " + (i + 1) + " Clit", "Rhett can't pierce this clit since it already is pierced!");
		}
	}
}

//Confirm payment
public function rhettPiercingsPayment(piercingVars:Array):void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“That'll be 100 credits,”</i> Rhett announces, gesturing to the tattooed android manning the counter. <i>“Just give it to him, and we'll get started.”</i>");
	
	clearMenu();
	addButton(0, "Pay", rhettPiercingsOuch, piercingVars);
	addButton(1, "Don't", rhettBackOut);
}

//Get pierced
public function rhettPiercingsOuch(piercingVars:Array):void
{
	var piercingIsAre:String = " is";//most body parts are singular except ears and nipples
	clearOutput();
	author("Jim T");
	
	switch(piercingVars[2])//switch on body part
	{
		case "ears":
			pc.earPiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]);
			piercingIsAre = " are";
		break;
		case "eyebrow": pc.eyebrowPiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "nose": pc.nosePiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "lip": pc.lipPiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "belly": pc.bellyPiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "tongue": pc.tonguePiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "nipples":
			pc.breastRows[piercingVars[3]].piercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]);
			piercingIsAre = " are";
		break;
		case "cock": pc.cocks[piercingVars[3]].piercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "vagina": pc.vaginas[piercingVars[3]].piercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
		case "clit": pc.vaginas[piercingVars[3]].clitPiercing = new RhettSimplePiercing(piercingVars[0], piercingVars[1]); break;
	}
	
	output("After you transfer the credits, you follow Rhett into his parlor in the back. ");
	if(flags["RHETT_HAS_WORKED_ON_BEFORE"] == undefined)
	{
		output("It's surprisingly sterile and white, with plenty of medical science devices. There's an expensive looking centrifuge and a large steel-lined fridge labelled 'Medical Materials'. In the center is a sleek looking tattooist's chair, ");
		if(pc.isTaur()) output("which morphs suddenly to be taur-friendly. He then instructs you to get on it");
		else output("which you're instructed to sit down in");
	}
	else
	{
		output("You sit down in the familiar, sleek tattooist's chair");
		if(pc.isTaur()) output("–after it's morphed to be taur friendly, of course");
	}
	
	output(".");
	output("\n\nRhett shifts up to you and takes a genetic sample from you, then throws it up on holo-display. Silently, he begins typing away, working on the proper composition of skin-mod formula to give you. His eyes are intensely locked on the screen, and his fingers light up the air at a lightning pace.");
	output("\n\n<i>“... Got the measurements. Should be a few minutes as the batch cooks up,”</i> he bluntly informs you. You sit and wait until one of his machines dispenses a single canister. The skin-modder picks one out from the pack and inserts it into a pearly-looking gun. Pointing it at your [pc.skinFurScalesNoun], he pulls the trigger, and you're being hit with a small, pinpoint stream, like an air jet. ");
	output("\n\n<i>“Done. Just give it a moment,”</i> he states. Suddenly, you feel a strange, hollowing sensation in the spot he sprayed. Now that there's a natural hole where the piercing needs to go, he slips it in. <i>“... No fuss. ")
	if(flags["RHETT_HAS_WORKED_ON_BEFORE"] == undefined)
	{
		output("Huh. It's like your body just soaks in the mods.”</i>");
		IncrementFlag("RHETT_HAS_WORKED_ON_BEFORE");
	}
	else output("As usual, your body just soaks up the mods.”</i>");
	
	output("\n\n<b>Your " + piercingVars[2] + piercingIsAre + " now pierced!</b>");
	
	pc.credits -= 100;
	processTime(5);
	clearMenu();
	addButton(0, "Next", meetRhett);
}

//Get cold feet and back out
public function rhettBackOut():void
{
	clearOutput();
	author("Jim T");
	
	if(stage.contains(userInterface.textInput))//catch for users that back out during a text tattoo
		removeInput();
	
	output("<i>“Alright, no skin off my nose. Tell me if you change your mind,”</i> Rhett remarks. He then pulls out and lights a new cigarette.");
	
	processTime(1);
	rhettMenu();
}

//Backing out at the first chance gets a different blurb
public function rhettFristChanceBackOut():void
{
	clearOutput();
	author("Jim T");
	
	output("<i>“Huh. Okay then,”</i> Rhett remarks, face unchanging. He does, however, pull out another cigarette and light it.");
	
	processTime(1);
	rhettMenu();
}

//Play intro and display sex options
public function rhettSexMenu():void
{
	clearOutput();
	author("Jim T");
	
	clearMenu();
	
	if(pc.isTaur())
	{
		output("You saucily suggest to Rhett that you get better acquainted. You're left staring at his perfectly formed, yet utterly unreadable face. After an awkward moment, he coughs.");
		output("\n\n<i>“Sorry.... but I'm not really into 'taurs,”</i> he scratches the side of his head, <i>“Nothing personal, but I like to constrict my lovers. With all the body and wrapping, I can't get a good hold.”</i>");
		addButton(0, "Next", rhettMenu);
	}
	else
	{
		if(flags["RHETT_FUCKED"] == undefined)
		{
			output("You saucily suggest to Rhett that you get better acquainted. You're left staring at his perfectly formed, yet utterly unreadable face. After a moment of what you <i>assume</i> is consideration, the half-akhid man flicks away his nim-leaf into an ashtray, then gives a curt nod.");
			if(pc.isNaga()) output(" <i>“Well, you're definitely my type...”</i> Rhett appreciatively remarks, stroking his chin.");
		}
		else
		{
			output("You suggest to Rhett that perhaps you pick up from last time, in the back room? You're left staring at his perfectly formed, yet utterly unreadable face. Does he not want to do it? After a brief, apparently thoughtful pause, the half-akhid man flicks away his nim-leaf into an ashtray, then gives a curt nod.");
			if(pc.isNaga()) output("\n\n<i>“Sure. You're always a welcome sight, particularly naked...”</i> Rhett appreciatively remarks.");
		}
		
		if(pc.isNaga())
		{
			output(" After slithering up to you, he takes your hand, and swiftly leads you to the back room. You happily follow him. Once out of the common area, ");
			if(!pc.isNude()) output("your ");
			else output("he ");
		}
		else
		{
			output("\n\n<i>“Alright. Let's do it,”</i> Rhett gruffly states. He suddenly sweeps up towards you on his serpentine lower half. ");
			if(flags["RHETT_FUCKED"] == undefined) 
			{
				output("Before you can react, he's wrapped his gigantic midnight coils around you, and is slithering backwards towards the back room!");
				output("\n\nCaught utterly off guard by his sudden swoop, you ask him what he's doing. ");
				if(!pc.isNude()) output("Now out of the common area, your ");
			}
			else
			{
				output("Once again, you're wrapped in his gigantic midnight coils, being picked up and carried towards the back room!");
				if(!pc.isNude()) output(" Once there, your ");
			}
		}
		
		if(!pc.isNude())
		{
			if(pc.hasArmor()) output("[pc.armor]");
			
			if(pc.hasUpperGarment() && !pc.hasArmor()) output(pc.upperUndergarment.longName);
			
			if(pc.hasLowerGarment() && !pc.hasArmor() && !pc.hasUpperGarment()) output(pc.lowerUndergarment.longName);
			
			output(" is hastily whipped off");
			if(pc.hasArmor() && (pc.hasUpperGarment() || pc.hasLowerGarment()) || (pc.hasUpperGarment() && pc.hasLowerGarment()))
			{
				output(" followed by your ");
				if(pc.hasArmor() && pc.hasUpperGarment()) output(pc.upperUndergarment.longName);
				else output(pc.lowerUndergarment.longName);
			}
			
			if(pc.hasArmor() && pc.hasUpperGarment() && pc.hasLowerGarment()) output(" and " + pc.lowerUndergarment.longName);
			
			if(pc.isNaga()) output(". He then");
			else output(", before you're returned to his clutches.");
		}
		
		if(pc.isNaga())
		{
			output(" wraps his gigantic midnight coils around your humanoid upper half, ");
		}
		
		if(flags["RHETT_FUCKED"] == undefined)
		{
			if(pc.isNaga())
			{
				output("and you let out a surprised gasp—you're half snake, but you're being squeezed by <i>him!</i>");
				output("\n\nCaught utterly off guard by his sudden swoop, you ask him what he's doing, trying ");
			}
		}
		else
		{
			if(pc.isNaga())
			{
				output("and you gasp with pleasure—as a half snake, it's always interesting to be the one <i>squeezed</i> for a change.");
				output("\n\nYou try ")
			}
		}
		
		if(pc.isNaga()) output("not to tremble as y");
		else output(" Y");
			
		output("our" + (pc.isNude() ? "" : " now") + " naked body rubs sensuously against his shifting scales. The slow squeezing friction caresses against your nipples and presses");
		if(pc.hasBreasts()) output(" in your breasts.");
		else output(" against your chest.");
	
		if(pc.hasCock())
		{
			output(" Your constricted dick");
			if(pc.hasCocks()) output("s are");
			else output(" is");
			
			output(" also being mercilessly pressured, blood pumping down there and making you swiftly, achingly stiff!");
		}
		
		if(flags["RHETT_FUCKED"] == undefined) output("\n\n<i>“You said you wanted to fuck,”</i> Rhett stoically states, tilting his mirror shades, <i>“So we're going to fuck. Safe word is 'Pineapple'. Remember it.”</i>");
		else output("\n\n<i>“Hope you remember the safe word, babe...”</i> Rhett tilts his shades, <i>“... because you're not leaving here until I'm done with your sweet ass.”</i>");
	}
	
	clearMenu();
	addButton(0, "Orgasm.D", rhettOrgasmDenial, undefined, "Orgasm Denial", "He squeezes and teases you, keeping you on the brink of orgasm until you're a babbling mess!");
	addButton(1, "Blowjob", rhettBlowjob, undefined, "Blowjob", "He coils your lower body up and gets you to suck him off.");
	addButton(2, "AssFuck", rhettAssFuck, undefined, "Ass Fuck", "He fucks your ass mercilessly, keeping you trapped in his coils the entire time!");
	addButton(3, "'Pineapple!'", rhettPineapple, undefined, "Pineapple", "Cry out the safe word and tap out.");
}

//Rhett orgasm denial scene
public function rhettOrgasmDenial():void
{
	clearOutput();
	author("Jim T");
	
	output("Keeping quiet, you bite your lower lip, trying not to moan or whimper. Still, it's <i>very</i> hard as his silver-and-black scales brush, back and forth, against your stiff [pc.nippleColor] buds. You can't even");
	if(pc.legCount == 2) output(" rub your thighs together");
	else output(" budge your [pc.legs]");
	
	output(", because you're pinned in so tight! Restrained and helpless, you're utterly at his mercy, and that thought brings a flush to your cheek. Or it could be the squeezing, it's hard to tell!");
	output("\n\n<i>“Feeling snug in there?”</i> Rhett asks. You feel something slithering up your [pc.leg]. It feels tapered and smooth. The tip of his tail, perhaps? Sliding up the epicenter");
	if(pc.isNaga()) output(" and up your <i>own</i> scaley lower half");
	
	output(", it probes and strokes");
	
	if(pc.hasVagina()) output(" your tender pussy lips");
	else if(pc.hasCock()) output(" the tender flesh between your shaft and asshole");
	else if(pc.balls > 0) output(" the tender flesh between your balls and asshole");
	else output(" the tender flesh between your groin and asshole");
	
	output(" , drawing lazily back and forth. You quiver impotently in his powerfully coiled grasp");
	if(pc.isNaga()) output(", your upper half feeling chained and restrained. Only able to move your snake-tail and mouth, you moan as your");
	else output(", like every inch of you is chained and restrained. All you have is control of your mouth, which you use to moan as your");
	
	if(pc.hasVagina()) output(" snatch");
	else if(pc.balls > 0) output(" ball-bridge");
	else output(" perineum");
	
	output(" is mercilessly stroked, teased, and tormented.");
	if(pc.hasVagina())output(" Your girl juices shamelessly dribble on to his taunting tail-tip, your pussy eagerly lubing itself for his future entry.");
	else if(pc.hasCock()) output(" Pressing pointedly against your taint, the pressure reaches deep into your flesh, stimulating your prostate from the outside. You quake and dribble [pc.cumVisc] fluid from your dick-tip!");
	else output(" It rubs a little bit against your flexing ring, making you quake in delight.");
	
	output("\n\n<i>“I could keep you like this for ages, you know,”</i> the tattooed man informs you, dragging his tip sloooowly along your");
	if(pc.hasVagina()) output(" slick lips, then pushes it in, lightly pressing against your clit.");
	else output(" clenching ridge.");
	
	output(" <i>“On the brink of orgasm. Without release.”</i>");
	output("\n\n<i>“Y-you wouldn't–!”</i> you whimper, your mind already swimming with pleasure, thoughts a total jumbled mess.");
	output("\n\n<i>“I would. No. I WILL,”</i> Rhett informs you, his deep voice informing you from <i>somewhere</i> beyond the scale wall. True to his word, the serpentine man keeps you in");
	if(pc.isNaga()) output(" an almost");
	else output(" a");
	
	output(" total body clutch, your nipples mercilessly rubbed and your loins tortured and teased. You feel like you're going to go <i>mad</i> with pleasure–and just as you begin to spasmically quake, <i>right</i> on the brink of orgasm, he puts on the breaks... letting you cool down <i>just</i> long enough to wind you right back up again! The gap between breaks seem to become smaller and smaller, until the tiniest, teensiest brush against your loins is nearly enough to make you cream yourself on the spot!");
	output("\n\n<i>“Puh-please, sir, let me cuuumm~!”</i> you deliriously whimper, lavishing with praise, ANYTHING, so long as it lets you get off. You'd sign away your fortune, make yourself his slave, just to make this torturous pleasure end and gasp the glorious, body-wracking pleasure that he keeps pulling <i>just</i> out of your reach! You're physically crying now, your whole body quaking–you've totally lost control of it after being brought, time and again, to that orgasmic brink.");
	output("\n\n<i>“Oh? I'm not sure you want it,”</i> Rhett intones, flicking his tail oh-so-gently right next to your loins. Just that tiny brush is enough to make you babble and whimper uncontrollably. No shame is left. Nothing else is left except for the maddening maelstrom of <i>pleasure</i> sweeping through your body and soul, leaving a shattered little [pc.name] in its wake.");
	output("\n\n<i>“~I'm going to go crazy! Please, please, I'll love you forever, I'll live with your cock in my mouth, I'll do anything–juh-just let me get off~!”</i>");
	output("\n\nThere's the slightest and most merciful <i>stroke</i> against your privates. Everything–EVERYTHING–goes white. You let out a erotic scream and convulse uncontrollably in his clutches");
	
	if(pc.hasVagina())
	{
		output(" drooling and squirting your [pc.girlCumVisc] [pc.girlCumNoun]");
		
		if(pc.hasCock()) output(" and spurting out an ungodly amount of your [pc.cumVisc] [pc.cumNoun]");
		
		output(" against his scales.");
		if(!pc.isSquirter()) output(" You're not even a squirter, and you <i>still</i> spastically squirt from your snatch; that's how built up you are!");
	}
	else if(pc.hasCock()) output(" spurting out an ungodly amount of your [pc.cumVisc] [pc.cumNoun] against his scales.");
	else output(",");
	
	output(" You're left feeling like you're floating in some unspeakably infinite space... filled with love and pleasure... a mindless happiness that just never, ever seems to end...");
	output("\n\n... When you finally slip out of that unspeakably happy place, you feel like you crash hard–like an angel falling back to earth. You're shivering a lot, but you feel strangely warm and hugged. It takes you a long while to realise you're still in Rhett's scales, and he's lightly stroking your [pc.hair], speaking to you in surprisingly soothing tones.");
	output("\n\n<i>“There there, kid. You're okay. I've got you,”</i> Rhett tells you, and you blink dazedly. <i>“... You were in sub-space. Happens after a lot of play like that. Big highs come with big falls, you know.”</i>");
	output("\n\nYou flush, your whole lower body");
	if(pc.hasVagina() || pc.hasCock()) output(" impossibly sticky");
	else output(" tingling and hot");
	
	output(". Once you're finally able to stand again, the half-akhid man releases you from his scales. Your heart beats at a million miles an hour as you leave the back room, feeling on cloud nine. Meanwhile, <i>he</i> slips out after you, looking totally cool and composed, as if nothing had even happened! Still, he does seem to check out your ass as you walk out, his mouth quirking into the tiniest, self-satisfied smile.");
	if(flags["RHETT_FUCKED"] == undefined) IncrementFlag("RHETT_FUCKED");
	
	IncrementFlag("RHETT_ORGASM_DENIAL");
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Rhett blowjob scene
public function rhettBlowjob():void
{
	clearOutput();
	author("Jim T");
	
	output("While keeping your [pc.legs] and [pc.hands] pinned, Rhett's serpentine body loosens around your upper body. The tattooed man raises his body, until your face-first with his scaled loins. ");
	if(flags["RHETT_SUCKED"] == undefined)
	{
		output(" You blush, wondering exactly what he has planned–there's nothing there, right? You're proven wrong as a slight slit appears in his midnight scales, and a black phallus slides out from the crack. It just keeps coming and coming; where does it end? When it's finally out, your gobsmacked at the size of his <i>second</i> snake.");
	}
	
	output("\n\n<i>“Suck it,”</i> Rhett orders you, bringing his bulbous black head right to your wettened lips. With a tiny bit of trepidation, you wrap your mouth around his glans. As you timidly suck on the tip of his manhood, it begins to stiffen and rise. Encouraged, you suck on it harder, watching it twitch and ascend, getting even thicker–if such a thing were <i>possible</i>. It tastes a tiny bit sweaty, and manly, and all around delicious. As you breathe heavily through your nose, you suck in and swoon at his his exquisitely musky scent. <i>“Good");
	if(pc.isFeminine()) output(" girl");
	else output(" boy");
	
	output(",”</i> he groans, reaching out and stroking your bobbing head.");
	output("\n\nFor some reason, Rhett's encouragement makes your heart flutter, and you redouble your oral efforts. Wrapping your [pc.lips] fully around his swollen glans, you lash and lick it with your tongue. It tastes a tiny bit salty, and yet somehow delicious; definitely the taste of a man. Filled with lascivious greed, you stick your tongue in his cock hole, trying to lick along every last bit of his dick, not wanting a single inch of his magnificent tool to go unsavoured. A throaty groan from above fills you with pride; he's enjoying it! A tiny dribble of pre-cum dribbles onto your tongue, slathering it with his slick spunk. Gulping it down, you draw his throbbing staff forward and against the back of your throat–you want more!");
	output("\n\nYou're not the only one; the half serpent man is pressing his hips instinctively forward, trying to break the barrier separating him and your throat. You gag and splutter, copious amounts of drool sloppily running out your mouth and down your cheeks. He pulls back an inch, and you take a moment to breathe, before <i>you</i> try and push his sizable glans down your throat! Another gag, but you <i>swear</i> you got an inch further this time! A few more attempts, and your face must be a mess; your spit-slicked mouth now wetter than any pussy. When you press forward this time, you feel a slight resistance... and then your throat give way! His throbbing manhood suddenly slips deep into your throat, and you let out a muffled moan; <i>now</i> your mouth is a perfect sheathe for his dick!");
	output("\n\nLetting out a loud, enthusiastic groan, Rhett begins to slip in and out of your mouth, his cock head plumbing deep within your throat. Something's beating against your upper lip, and when you go cross eyed, you see a small lump on his upper dick. It kind of looks like a dusky clit! As he rubs it against you, his moans intensify, and even more slick goodness slips down your eagerly open throat. You press yourself forward, deliberately trying to brush and stimulate his bump, feeling his cock head flex excitedly in your gullet each and every time. You're so excited that you can't hold back, and begin to tremble–right on the verge of creaming your poor");
	if(pc.hasCock() || pc.hasVagina())
	{
		if(pc.hasCock())
		{
			output(" [pc.cocksNoun]")
			if(pc.hasVagina()) output(" and [pc.pussiesNoun]!");
		}
		else output(" [pc.pussiesNoun]!");
	}
	else output(" self!");
	
	output("\n\nJust as you're quaking and about to cum first, Rhett fiercely grabs the back of your head, thrusting himself until his waist is pressing against your prostrate lips! With a throaty moan, his thick manhood twitches against your tongue and throat. Warm slickness shoots in a long, gooey stream down your throat. You let out a muffled whimper and climax right there and then");
	if(pc.hasCock() || pc.hasVagina())
	{
		if(pc.hasCock())
		{
			output(" shooting");
			if(!pc.hasCocks()) output(" a");
			
			output(" [pc.cumColor]");
			if(pc.cumQ() < 100) output(" splutter");
			else if(pc.cumQ() < 400) output(" stream");
			else output(" surge");
			
			if(pc.hasCocks()) output("s");
			
			output(" out of your pinned prick");
			if(pc.hasCocks()) output("s");
			
			if(pc.hasVagina())
			{
				output(" and")
				
				if(pc.isSquirter()) output(" squirting");
				else output(" drooling");
				
				if(!pc.hasVaginas()) output(" a");
				
				output(" [pc.girlCumVisc] stream");
				if(pc.hasVaginas()) output("s");
				
				output(" of [pc.girlCumNoun] down your [pc.thighs]");
			}
		}
		else if(pc.hasVagina())
		{
			if(pc.isSquirter()) output(" squirting");
			else output(" drooling");
			
			if(!pc.hasVaginas()) output(" a");
			
			output(" [pc.girlCumVisc] stream");
			if(pc.hasVaginas()) output("s");
			
			output(" of [pc.girlCumNoun] down your [pc.thighs]");
		}
	}
	
	output(".");
	output("\n\nWith your tongue coated in his marvellously moist cum, you swallow it with a gulp, sending it down with the rest to your belly. You're then released from his coils, though you're a bit wobbly");
	if(pc.isNaga()) output(" on yours.");
	else output(" on your [pc.feet].");
	
	output(" Wandering out to the store, you touch your lips with a dreamy expression, followed by the tattoed half-akhid. When you look behind you, you swear you see a hint of a satisfied grin on his face.");
	if(flags["RHETT_FUCKED"] == undefined) IncrementFlag("RHETT_FUCKED");
	
	IncrementFlag("RHETT_SUCKED");
	processTime(30);
	pc.orgasm();
	pc.loadInMouth(chars["RHETT"]);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Rhett ass fuck scene
public function rhettAssFuck():void
{
	clearOutput();
	author("Jim T");
	
	output("You let out a shuddering groan as his silver-and-black scales drag across your sensitive");
	if(pc.hasBreasts()) output(" breast");
	else output(" chest")
	
	output(" nubs, teasing them to exquisite");
	if(pc.hasCuntNipples()) output(" wetness.");
	else output(" hardness.");
	
	output(" His squeezing serpentine body seems to be tighter around your [pc.legs], keeping them particularly pinned. Loosening around your upper half, you can't see the taut, tattooed man anywhere. <i>Where has he gone,</i> you wonder?");
	output("\n\nYou gasp as you feel a deliciously stiff body pressing against your back, intimately close. A pair of strong arms slip around your waist, and there's a biting at your [pc.ear]. Just a nip, followed by a whisper. <i>“... ");
	if(flags["RHETT_FUCKED"] == undefined) output("Time to put that sweet ass of yours to work.”</i>");
	else output("I told you, I'm going to use your ass.”</i>");
	
	output("\n\nYou can feel a stiffness even <i>harder</i> than his chiseled pecs, pointedly pressing between your buttocks. With your [pc.legs] caught and coiled, and your hips now seized, you're utterly at Rhett's mercy! The serpentine man seizes the chance to slip his rigidity up and into your [pc.asshole], slowly sheathing himself inside of your");
	if(pc.analVirgin) output(" virgin rump. Gasping at the strange intruder–the first you've ever felt–you blush and realize this will be a moment you will remember for the rest of your life!");
	else output(" rump.");
	
	output(" You gasp at the");
	if(flags["RHETT_ANAL_FUCKED"] == undefined) output(" surprisingly");
	else output(" amazingly");
	
	output(" <i>long</i> and <i>thick</i> intruder as it inches upward, until his bulbous cockhead is flexing inside the deepest depths of your [pc.skinColor] butt.");
	pc.buttChange(0);
	
	output("\n\nYou instinctively clench at his cock base with your pucker, but it's so thick it's like trying to grip a baseball bat. Feeling impossibly stuffed with twitching muscled cock, you can't even move your hands, since they're pinned down with your hips. All you can do is take his massively long dick, not even able to touch yourself down <i>there</i>");
	if(pc.hasCock() || pc.hasVagina())
	{
		output("–though you can feel your");
		
		if(pc.hasCock())
		{
			output(" [pc.cocksSimple]");
			if(pc.hasVagina()) output(" and [pc.pussiesSimple] getting hard and wet"); 
			else output(" getting hard");
		}
		else output(" [pc.pussiesSimple] getting wet");
	}
	
	output(".");
	output("\n\nRhett pulls you back with his forceful hands and onto his throbbing manhood, simultaneously slapping his rigid hips up and against your ass. There's no other word for it; your [pc.skinColor] butt being thoroughly <i>claimed</i> by the thoroughly tattooed man. Every time he gives another seismic thrust, his gloriously large crown caresses your tender");
	if(pc.hasCock()) output(" prostate.");
	else output(" rectum.");
	
	output("\n\nWith each and every thrust, your defense wavers, and your pucker loosens another inch–allowing him to claim you deeper and more totally. Your mind is swooning with ass-induced pleasure. All you can think about, again and again, is how totally and one-sidedly you're being fucked by this muscular man. As his dick delves into you, right up to the hilt, he gives a pointed squeeze of his shaft and tip, sending you right over the edge! With a quivering cry, you cream yourself right there and then");
	if(pc.hasCock() || pc.hasVagina())
	{
		output(",");
		if(pc.hasCock())
		{
			output(" shooting");
			if(pc.cumQ() < 100) output(" tiny spurts");
			else if(pc.cumQ() < 400) output(" gooey ropes");
			else output(" sloppy streams");
			
			output(" of hot [pc.cumNoun] through the air and up against your own belly");
			if(pc.hasVagina())
			{
				output(" and");
				if(pc.isSquirter())
				{
					output(" squirting");
					if(pc.hasVaginas()) output(" thin streams");
					else output(" a thin stream");
					
					output(" of [pc.girlCum]");
				}
				else
				{
					output(" drooling");
					if(pc.hasVaginas()) output(" thin streams");
					else output(" a thin stream");
					
					output(" of [pc.girlCum]");
				}
			}
		}
		else
		{
			if(pc.isSquirter())
			{
				output(" squirting");
				if(pc.hasVaginas()) output(" thin streams");
				else output(" a thin stream");
				
				output(" of [pc.girlCum]");
			}
			else
			{
				output(" drooling");
				if(pc.hasVaginas()) output(" thin streams");
				else output(" a thin stream");
				
				output(" of [pc.girlCum]");
			}
		}
	}
	
	output(". You tremble in his grasp, spasmically squeezing his masculine rod. It twitches all of a sudden, and there's a hot, creamy rush up inside your rectum–Rhett is cumming inside of you! All you can do is moan your pleasure as you are filled with his gooey naga spunk, your completely plugged hole filled up to the brink.");	
	output("\n\nWhen he finally pulls out of you, there's a delicious 'plopping' noise, and you feel a hot, streamy dribble running down and out of your slightly gaping butthole. Instinctively, you try to clench and keep it in–you want as much of <i>him</i> to stay inside you as possible! There's a fierce kissing at the nape of your neck, followed by a pointed suckling. Is-is he leaving hickeys on you? You let out a dreamy moan as you're marked by Rhett, possessively littered with tiny, kiss-sized bruises.");
	output("\n\nAfter a long, sensually-spent afterglow, you're released from his coils. Collecting your things, you head out first, feeling giddy and a little wobbly on your [pc.feet]. You're followed by the surprisingly composed looking half-akhid, who is already slipping back on his mirrored shades. He does give your leaking ass a quick look; it seems he's appreciating his handiwork!");
	
	if(flags["RHETT_FUCKED"] == undefined) IncrementFlag("RHETT_FUCKED");
	
	IncrementFlag("RHETT_ANAL_FUCKED");
	processTime(30);
	pc.orgasm();
	pc.loadInAss(chars["RHETT"]);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Rhett safe word scene
public function rhettPineapple():void
{
	clearOutput();
	author("Jim T");
	
	output("You cry out the safe-word, totally tapping out early. You're immediately released from the half-akhid's grasp, and he gives a curt little nod. <i>“Right, tell me if you change your mind.”</i>");
	output("\n\nRhett slithers back to the storefront, and you");
	if(pc.isNude()) output(" follow");
	else output(" pick up your clothes, following");
	
	output(" him back out. He's already calmly leaning back against the counter, looking as though nothing even happened.");
	
	processTime(4);
	clearMenu();
	addButton(0, "Next", meetRhett);
}

//Sky Sap interaction start
public function rhettSkySap():void
{
	clearOutput();
	author("Jim T");
	
	if(flags["RHETT_SKY_SAP"] == undefined)
	{
		output("<i>“Oh, hey, you're a rusher, right?”</i> Rhett asks, out of nowhere.");
		output("\n\nYou nod, and he tilts his mirrored shades. <i>“... Good. I'm low on some gene supplies; mainly the bioluminous stuff. Shipping leithan-grade samples all the way out here from Alpha Centurii is pretty expensive, so I'm looking for a new supply.”</i>");
		output("\n\n<i>“Word is there's some sort of natives on Mhen'ga who have naturally luminescent markings. If you can bring me sample matter from them, that'd be really handy. I could start selling glowing tattoo mods again.”</i>");
		output("\n\n<b>You can now trade Sky Sap to Rhett for money and luminescent skin mods.</b>");
		flags["RHETT_SKY_SAP"] = 0;
	}
	else
	{
		output("<i>“Got some sky sap? ");
		if(flags["RHETT_SKY_SAP"] < 10) output("I can't do luminescent skin mods until we get some more");
		else output("We can always use more of the stuff");
		
		output(".”</i>");
	}
	
	clearMenu();
	processTime(1);
	if(pc.hasItemByClass(SkySap)) addButton(0, "Give Sky Sap", rhettGiveSkySap);
	else addDisabledButton(0, "Give Sky Sap", "Give Sky Sap", "You don't have any Sky Sap to give!");
	addButton(14, "Back", meetRhett);
}

//Sky Sap trade interaction and luminous color unlock
public function rhettGiveSkySap():void
{
	clearOutput();
	author("Jim T");
	
	var quanitity:int = pc.numberOfItemByClass(SkySap);
	
	for (var x:int = quanitity ; x > 0 && flags["RHETT_SKY_SAP"] < 10; x--) IncrementFlag("RHETT_SKY_SAP");
	pc.destroyItemByClass(SkySap, -1);
	
	if(flags["RHETT_LUMINOUS_TATTOOS"] == undefined && flags["RHETT_SKY_SAP"] > 9)
	{
		IncrementFlag("RHETT_LUMINOUS_TATTOOS");//unlock luminous colors(Luminous Violet, Luminous Purple, Luminous Blue, Luminous Pink, Luminous Orange, Luminous Green, Luminous Silver, Glowing Gold)
		output("<i>“Great. We've finally got enough to start doing luminous tattoos again. And here's " + (quanitity * 50) + " credits for the sap. You've been a big help”</i>");
	}
	else
	{
		output("<i>“Thanks. Here's " + (quanitity * 50 ) + " credits for the trouble. ");
		
		if(flags["RHETT_SKY_SAP"] < 10)
		{
			if(flags["RHETT_SKY_SAP"] < 8) output("Bring in several more");
			else if(flags["RHETT_SKY_SAP"] < 9) output("A couple more");
			else if(flags["RHETT_SKY_SAP"] < 10) output("Just one more")
			
			output(" and I'll be able to get back to doing glowing tattoos.”</i>");
		}
	}
	
	pc.credits += quanitity * 50;
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", meetRhett);
}