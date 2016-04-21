import classes.Characters.PlayerCharacter;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Engine.Combat.DamageTypes.DamageFlag;
import classes.GameData.Pregnancy.Handlers.VenusPitcherFertilizedSeedCarrierHandler;
import classes.Items.Accessories.LeithaCharm;

public function uvetoSpaceElevatorBaseBonus():Boolean
{
	if (flags["UVETO_GREETING_PARTY"] == undefined)
	{
		flags["UVETO_GREETING_PARTY"] = 1;
		uvetoGreetingParty();
		return true;
	}
	addButton(5,"S.Elevator",rideSpaceElevatorUp,undefined,"Space Elevator","Ride the space elevator up to the station.");
	return false;
}

public function uvetoGreetingParty():void
{
	clearOutput();
	
	flags["CODEX_UVETO_TRACKER"] = 1;

	output("You approach the industrial space elevator, glancing the reinforced cart up and down within the gun barrel tube it’s tracked to. You could see the tube going all the way down on your way in, a measure of some several miles exposed to space with nothing but a thin veneer of super-hardened metal and plasteel between you and the vacuum of space. Comforting thought.");
	
	output("\n\nStill, several other spacers are coming and going between trips, man-handling cargo on and off. Seems this is your only way down, after all, so you step towards the door.");
	
	output("\n\nBefore you can");
	if (pc.isNaga()) output(" slither onto");
	else output(" set foot on");
	output(" it, though, you feel a hand on your shoulder. Big. Muscular. Pulling just hard enough to make you turn and face its owner.");
	
	output("\n\nYou find yourself staring ");
	if (pc.tallness < 78) output(" up");
	else if (pc.tallness > 90) output(" down");
	output(" at a giant of an ausar, nearly seven feet tall, and extraordinarily... well, husky, in every sense of the word. Heavyset and broad-shouldered, muscular underneath a skin-tight suit, with a head of silver hair and a long beard well past his collar. He’s wearing a weather-beaten long blue coat over a corporate jumpsuit, which does little to hide his bear-like physique.");
	
	output("\n\n<i>“Hold on a moment, friend,”</i> the man says. His voice is like gravel, deep and grounded. <i>“You’re not going down there just yet.”</i>");
	
	output("\n\nFor a moment, your mind races to grim conclusions... right up until a second ausar, a curvy woman in the black-and-gold of a Steele Tech uniform steps out from behind her towering counterpart, followed by a pair of other figures who are all smiles and cheer.");
	
	output("\n\nThe black-dressed woman skips up to you and grabs your hand, grinning ear to fluffy ear. <i>“Heyo! You’re [pc.name], right? We heard your ship docked. Just wanted to say ‘hello!’ on behalf of the local Steele Tech branch.”</i>");
	
	output("\n\nAs she shakes your hand, you’re treated to a show of her skin-tight uniform perfectly accompanying the free jiggle of her large breasts. Though that’s not the only thing that’s large! Like her male counterpart, she’s distinctly on the heavyset side, and with her sleeves rolled up, you can see the fur on her arms is much thicker than her race’s norm. And the mane of silver-blue fur around her neck... something tells you that’s not just a fluffy scarf!");
	
	output("\n\nLooking between the two of them, it’s clear to see the local ausar have adapted to the wintery environment.");
	
	output("\n\nA third ausar with the same greyish fur and hair as the first two, catches your wandering eyes and giggles. The ice-blue and silver uniform she’s wearing marks her as an Akkadi employee, you think, though even their jumpsuit’s just as skin-hugging as the one your father designed, showing off the second big beauty’s curves in alluring detail. <i>“Oh, somebody’s never seen a huskar before!”</i> she laughs, wrapping her arms underneath her prodigious bosom.");
	
	output("\n\n<i>“[pc.HeShe] would have a hard time finding one anywhere else,”</i> the fourth and final member of the group adds, stepping up and giving you a curt nod. You blink back a hint of surprise as the final voice draws your attention to a tall, sleek feminine form, much less curvaceous than the others - almost athletic, even, though not without a distinctly feminine figure. One that is very, very obviously synthetic. Silver-grey skin is shaped in roughly ausar form, packed into an Akkadi jumpsuit you’re not entirely convince isn’t integrated with her body, the way it seamlessly fits her supple hourglass curves.");
	
	output("\n\n<i>“We’re not the </i>only<i> ice colony in the Federation, Senrah,”</i> the male of the group grunts, leaning against the side of the elevator tube. <i>“Anyway, we didn’t stop you to show off. Well, not just,”</i> he chuckles, making a very obvious flexing gesture. His coat finally gives way enough to let you see the dark blue and purple of the Xenogen Biotech uniform underneath.");
	
	output("\n\nThe Akkadi-dressed girl sticks her tongue out at him. <i>“Who </i>wouldn’t<i> want to show off for a rich, hot play"+ pc.mf("boy", "girl") +"?”</i>");
	
	output("\n\nShe gives you a wink and pushes her shoulders together, making her G-cups seem just that much bigger and bouncier for you.");
	
	output("\n\n<i>“Keep it in your pants, please,”</i> the synthetic sighs before returning her attention to you. <i>“My compatriots and I simply wanted to express a warning: <b>the surface of Uveto is extraordinarily hostile. Dangerously so, if you come unprepared.</b> Personal heat generators are available at a subsidized discount here on the station. Buy one if you wish to avoid frostbite, and the annoyance of the rather brusque rescue crew that will be forced to... well, rescue you.”</i>");
	
	output("\n\n<i>“Oh, that’s right! I’m supposed to give you this,”</i> the bubbly Steele employee adds, reaching into a pocket and producing a small data chip. <i>“It’s a Codex plugin we made for people going planet... uh, moon-side. Basically an emergency transponder and a GPS all rolled into one. If you get hurt or start to freeze, it’ll automatically send a distress signal to the Scouts. They’ll come help you!”</i>");
	
	output("\n\nHandy. You take the chip and plug it into one of your Codex’s dataports. It updates in the blink of an eye, registering new software.");
	
	output("\n\n<i>“Still,”</i> the Xenogen man adds, patting the Steele-girl’s head between the ears. <i>“Most of the moon’s surface is feral. Poorly mapped, full of milodan and korgonne raiders who haven’t gotten civilized yet. Worse things, if you go too far out. <b>Stay away from the Rift - that’s way east of the town - unless you’re looking for trouble.</b>”</i>");
	
	output("\n\nYou nod your understanding and pocket the Codex again. Anything else?");
	
	output("\n\n<i>“Nope!”</i> the black-dressed huskar smiles, wagging her silver tail. <i>“Just wanted to touch base while we’re on break! If you need anything, Dr. Lessau and Director Rhenesuune manage most of Steele’s interest here on the planet. They can give you the hook up!”</i>");
	
	output("\n\n<i>“As an unbiased, non-Steele Tech affiliated intelligence,”</i> the robotic woman adds, fixing you with her black-eyed gaze. <i>“Be careful around the Director. She’s a real-”</i>");
	
	output("\n\n<i>“Ball-buster,”</i> the man finishes with a guffaw. <i>“That about sum it up?”</i>");
	
	output("\n\nThe robot nods sharply. <i>“Yes. A ‘ball-buster.’”</i>");
	
	output("\n\nWell, you’ll certainly keep that in mind. You thank the quartet for their advice - and the rescue protocol - and turn back to the elevator.");
	
	output("\n\n<i>“See ya, cutie!”</i> the Akkadi ausar giggles, blowing you a kiss.");
	
	output("\n\nThe other woman blushes, but still wags her tail as you turn to leave. Over your shoulder, you hear her whispering, <i>“Stop flirting with my maybe-boss! I get first dibs!”</i>");
	
	output("\n\n<i>“Ladies. We can all share.”</i>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function rideSpaceElevatorUp():void
{
	clearOutput();
	author("Savin");
	kGAMECLASS.currentLocation = "GAME OVER";
	kGAMECLASS.generateMap();
	showName("SPACE\nELEVATOR");
	output("Once again, you board the Irestead space elevator - this time, going up. Unlike your trip down, the elevator’s barely occupied: only a couple of other spacers join you aboard, though the ever-present cargo remains aboard. Raw minerals from the Uvetan mines, you’d guess. A few moments after you embark, the station controller seals the doors, and you feel a sudden heft of gravity under your [pc.feet].");

	output("\n\nIt isn’t long before you’re racing upwards, hurtling through the atmosphere and into the heavens. The swirling colors of the Uvetan gas giant rise over the curves of the moon as you leave, bathing you in radiance for the brief trip back into orbit. The temperature drops rapidly as you ascend, at least in comparison to the control station, settling into a comfortable chill when the elevator locks into place at the space station’s center.");

	output("\n\nThe elevator locks in place with a distinctive ding, flashing its internal lights off and back into the sterile glow of the station interior.");

	output("\n\n<i>“Welcome back to Uveto Station,”</i> an artificial voice intones as you disembark. <i>“Please enjoy your stay.”</i>");

	processTime(45);
	clearMenu();
	addButton(7,"Exit",move,"UVS D7");
}

public function uvetoSpaceElevatorBonus():Boolean
{
	addButton(7,"S.Elevator",rideSpaceElevatorDown,undefined,"Space Elevator","Ride the space elevator down to the ice moon's surface.");
	return false;
}
public function rideSpaceElevatorDown():void
{
	clearOutput();
	kGAMECLASS.currentLocation = "GAME OVER";
	kGAMECLASS.generateMap();
	showName("SPACE\nELEVATOR");
	author("Savin");
	//First Time
	if(flags["UVETO_ELEVATORED"] == undefined) 
	{
		output("The Uveto Station elevator doesn’t look like much when you first board it: it could easily have passed for a between-decks cargo lift at the Tavros docks, laden with crates of industrial supplies and a scant handful of people. Most of the boxes bear the sunny, curvaceous logo of RhenWorld or the sleek Akkadi symbols; the people are uniformly grizzled and heavily clothed, wearing high tech heat generators over padded jackets and thick gloves.");
		//if nudist / no heat belt: 
		if((pc.isNude() || pc.isCrotchExposed() || pc.isChestExposed()) && 9999 == 9999) output("\n\nYou suddenly get the impression you’re woefully underprepared for visiting this unforgiving frozen world.");
		output("\n\nThe elevator shudders under your [pc.feet], and a metal bulkhead slides down over the entrance, sealing you in with a pneumatic hiss. For a brief moment, you’re surrounded by cold steel on all sides, encased in blackness. Dark red lights kick on a moment later, thankfully, giving some scant illumination as the elevator begins the long descent down.");
		output("\n\nThe elevator’s speed picks up until it seems like you could fly off the deck at any moment, thundering down the metallic shaft towards the planet’s surface. You feel like a bullet through a gun’s barrel, waiting to erupt into the endless black of space.");
		output("\n\nThen, suddenly, you’re overwhelmed with light. You’re forced to shield your eyes against the unexpected glare, recoiling for a moment before opening your eyes and taking in the grandeur of space itself. The metallic coating of the elevator has given way to a translucent material, revealing the titanic gas giant Uveto in the distance, cresting the curving surface of the icy moon below. A planet rise, not a sunrise, but still just as radiant as anything you’ve seen before.");
		output("\n\nThe roiling gasses of the Uvetan giant cast brilliant colors across the surface of the tether’s shaft, not unlike a dark rainbow. Below you, the icy seventh moon rises towards you rapidly, reaching up to embrace you. The elevator begins to slow, machinery whirring underneath you to control the car’s descent as you begin to pass through the moon’s upper atmosphere. A moment later and you’re passing through the clouds, vision becoming obscured by ice and mist.");
		output("\n\nThe elevator screeches loudly, making your stomach lurch as it slows to a crawl at the top of a large, domed complex in the middle of a sprawling, snow-covered city. When the car finally comes to a halt, the door slide open with a hiss and a rush of air, depositing you in the middle of a metal-walled, heated complex.");
		output("\n\nA sign nearby simply states, <i>“<b>Welcome to Irestead.</b>”</i>");
	}
	//Repeat
	else
	{
		output("Once more you board the Station-Irestead space elevator, joining a handful of other colonists and spacers, and what looks like a ton of industrial cargo heading down. A few moments after you board, the station controller seals the elevator shaft and sends the cart downwards. Speed picks up rapidly, making you feel as though you could go flying off at any moment. The metal shield around the shaft gives way half way down, bathing you once more in stellar light, a rainbow of colors reflecting off the Uvetan gas giant.");
		output("\n\nIt’s a long ride down, growing colder by the moment as you pass through Uveto VII’s atmosphere and into the stormy world’s embrace. The Irestead control building reaches up to embrace you, though, a nest of warmth and safety. Your ride ends inside it, and the elevator doors open with a hiss and a rush of warm air.");
		output("\n\nA sign near where you disembark simply states, <i>“<b>Welcome to Irestead.</b>”</i>");
	}
	IncrementFlag("UVETO_ELEVATORED");
	processTime(45);
	clearMenu();
	addButton(7,"Exit",move,"UVI F34");
}


public function uvetoUnlocked():Boolean
{
	return flags["UVETO_UNLOCKED"] != undefined || reclaimedProbeMyrellion() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords"));
}

public function flyToUveto():void
{
	if (flags["DO UVETO ICEQUEEN ENTRY"] != undefined) clearOutput();
	author("Savin");

	if (flags["VISITED_UVETO"] == undefined)
	{
		output("The fringe of the Siretta system is quite unlike the heartlands, the frosty resort worlds nearer to the sun where you remember your father would often take his lover of the week to ski. Here, the Black is dominated by a massive belt of asteroids, shielding the furthest planet from the sun from sight. Your destination is not the tremendous, Jovian gas giant standing sentinel at the edge of the system, however, but one of its twelve moons: the frozen ice ball of Uveto VII.");
		
		output("\n\nYour screen buzzes to life as you near your destination. <i>“Good day to you, traveler!”</i> announces the odd creature on screen.");
		if (flags["MET_ORRYX"] != undefined) output(" You recognize the creature as a tove, the tiny, stuffed-animal-like race.");
		else output(" You’re not sure what this plush-furred, squat creature is, but its beak clacks open and shut comically as it speaks.");
		
		output("\n\n<i>“You’ve entered into privately-owned orbital space. If you would like to dock with Camarilla station number six-three-two-oh-one, a wabeshift will intercept your path in approximately 1 hour.  Please use the time to fill out all waivers and declarations for quick and easy processing.”</i>");
		
		output("\n\nYou hear multiple bings as a side monitor opens a cascade of pure-text forms and contracts. <i>“If you do not have business with the Camarilla at this time, I encourage you to adjust your orbit elsewhere, as any undocumented entry onto this planet will be construed as a breach of corporate treaty and we will be forced to sue with extreme prejudice.”</i>");

		//if (flags["MET_ORRYX"] == undefined)
		if (!CodexManager.hasUnlockedEntry("Camarilla")) output("\n\nYou ask for more information about the planet. Does this creature's species live there?");
		else output("You ask if there's a tove colony of Uveto. You certainly weren't expecting one.");

		output("\n\n<i>“On that ice ball? High Executives, no! You couldn’t pay me to set foot on that hellsphere!”</i>");
		
		output("\n\nFrom what you’ve seen of the monetary penalties mentioned on every line of these documents, you’re pretty sure that means a lot coming from him.");
		
		output("\n\n<i>“Nono, no Tove sets down on there for more than a day or so.  However, we are the official representatives of the multi-corporate trade conglomerate that owns Uveto, pursuant to Confederate Mega-Corporate bylaws. The Camarilla is also of course responsible for the safety and security of a nativized race of ausar, who we care for greatly.”</i>");
		
		output("\n\nHis beaked, four-eyed face is very hard to read, but you have your suspicions about that last part.");
		
		output("\n\nYou give a resigned sigh and cut the comms, starting to fill out your mountain of paperwork...");
	}
	else
	{
		output("As you near Uveto, a familiar bing echos from your comm station, and a fluffy tove appears on your holoprojector, greeting you once again. <i>“Welcome back to Uveto, Captain Steele. If you have business with the GGC or its subsidiaries located on the surface of Uveto, please fill out the attached forms and waivers. Remember that any undocumented entry onto this planet will be construed as a breach of corporate treaty and we will be forced to sue with extreme prejudice.”</i>");

		output("\n\nYou sigh as several forms rush onto your computer’s terminals. Thankfully, the pile’s significantly reduced since your first encounter with the planet’s sue-happy owners. You cut the comms and resign yourself to filling out the forms until their escort ship intercepts you.");
	}

	clearMenu();

	if (flags["DO UVETO ICEQUEEN ENTRY"] == undefined)
	{
		addButton(0, "Next", actuallyArriveAtUvetoStation);
	}
	else
	{
		flags["DO UVETO ICEQUEEN ENTRY"] = undefined;
		addButton(0, "Next", iceQueenUvetoEntry, flags["VISITED_UVETO"]);
	}

	flags["VISITED_UVETO"] = 1;
}

public function actuallyArriveAtUvetoStation():void
{
	clearOutput();
	author("Savin");

	output("<b>An hour passes...</b>");
	
	output("\n\nJust as you’re getting through with the mountain of legal gobbledygook the tove sent you, your proximity sensors alert you to the approach of a large ship bearing the trade IDs of the Camarilla. You respond to a message blip ordering you to power down weapons and shields and follow the <i>“wabeshift”</i> to Uveto Station’s docking terminal. You do as you’re ordered and switch the autopilot on, letting it dog the Camarilla ship in towards the station.");
	
	output("\n\nUveto Station’s a small affair, one of the pre-fab low-orbit control stations common on frontier worlds too inhospitable to support a full colony. Why it’s in what’s been a core world for centuries, you have no idea. A thick tether connects it to the planet below - a space elevator, you imagine - and several long, curving arms extend from the central unit of the station, providing a great deal of docking space. You suppose there must not be a spaceport on the surface of the planet.");
	
	output("\n\nThe wabeshift guides you to one of the docking arms, and shunts you into one of the many empty berths. Most of the other ships you can see look like heavy freighters, the kind used to haul thousands of tonnes of cargo across Confederate space - usually raw materials or industrial equipment. You allow the station to extend a docking clamp and access tunnel to your airlock, sealing with an audible <i>thump</i> that shudders through your ship.");
	
	output("\n\nYou grab your gear");
	if(leaveShipOK()) output(" and head onto the station.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function tryApplyUvetoColdDamage():void
{
	var tPC:PlayerCharacter = pc as PlayerCharacter;
	
	var coldDamage:Number = -1;
	var resistToMitigate:Number = -1;
	
	if (InRoomWithFlag(GLOBAL.OUTDOOR))
	{
		coldDamage = 5;
		resistToMitigate = 25;
	}
	else if (InRoomWithFlag(GLOBAL.ICYTUNDRA))
	{
		coldDamage = 10;
		resistToMitigate = 40;
	}
	
	if (coldDamage > 0 && tPC.willTakeColdDamage(resistToMitigate))
	{
		if (tPC.skinType == GLOBAL.SKIN_TYPE_FUR)
		{
			coldDamage *= 0.5;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_SCALES))
		{
			coldDamage *= 1.25;
		}
		else if (InCollection(tPC.skinType, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX))
		{
			coldDamage *= 1.5;
		}
		
		if (tPC.isNude())
		{
			coldDamage *= 2.0;
		}
		else
		{
			var nakednessMulti:int = 1;
			if (!tPC.hasArmor()) nakednessMulti += 0.333;
			if (!tPC.hasUpperGarment() || tPC.isChestExposed()) nakednessMulti += 0.333;
			if (!tPC.hasLowerGarment() || tPC.isCrotchExposed()) nakednessMulti += 0.333;
			coldDamage *= nakednessMulti;
		}
		
		var actualDamage:TypeCollection = new TypeCollection( { freezing: coldDamage }, DamageFlag.BYPASS_SHIELD);
		var damageResult:DamageResult = applyDamage(actualDamage, null, tPC, "suppress");
		
		if (damageResult.totalDamage > 0)
		{
			output("\n\nYou wrap your arms around yourself, desperately trying to fend off the overwhelming cold. The planet's freezing you to your bones");
			if (!tPC.isNude()) output(", no matter how much clothing you wear");
			else output(" -- and being naked, you've got next to no defense against the chill");
			output(". You feel like you might collapse if you don't take shelter soon!");
			outputDamage(damageResult);
		}
	}
}

public function hookUvetoRoomRemoveCold(direction:String):void
{
	removeUvetoCold();
	move(rooms[currentLocation][direction]);
}

public function removeUvetoCold():void
{
	if (pc.hasStatusEffect("Bitterly Cold"))
	{
		pc.removeStatusEffect("Bitterly Cold");
	}
}

public function hookUvetoRoomAddCold(direction:String):void
{
	addUvetoCold();
	move(rooms[currentLocation][direction]);
}

public function addUvetoCold():void
{
	if (!pc.hasStatusEffect("Bitterly Cold"))
	{
		(pc as PlayerCharacter).createStatusEffect("Bitterly Cold", 0, 0, 0, 0, false, "Icon_Snowflake", "The bitter, piercing cold of Uveto's icy tundra threatens to chill you to the bone. Better wrap up nice and tight, maybe even find something to heat you up to better stave off the freezing winds.", false, 0, UIStyleSettings.gColdStatusColour);
	}
}

public function uvetoLastChanceStoreEntry():Boolean
{
	if (flags["MET_NERRASA"] == undefined)
	{
		output("\n\nA caramel-skinned ausar woman is sitting behind the counter, pumping iron. Unlike most ausar here, she’s <i>ripped</i>, and wearing a white tank top to show off her glistening muscles while she works. A pair of brilliant, almost glowing, orange eyes regard you warily between reps. Their owner gives you a slight nod of recognition when you enter the shop, but she seems otherwise content to keep working out in peace.");

		addButton(0, "Approach", uvetoApproachNerrasaFirstTime);
	}
	else
	{
		var r:int = rand(3);
		switch(r)
		{
			case 0:
				output("\n\nNerrasa is sitting behind the counter as usual, pumping iron and bobbing her head to the beat of the thrashy metal playing over the shop’s speakers. The way she’s sitting, leaning forward with her sweat-slicked tank top hugging her half-bared cleavage and exposing her rippling muscle, she’s clearly content to let you watch her work.");
				break;
			case 1:
				output("\n\nThe hellhound owner has bolted a bar to the ceiling over the counter, and is using it to do rapid-fire pull-ups. Her head’s obscured by the heater, but she’s perfectly positioned to show off her big breasts bouncing up and down under her tank top with every motion. No sports bra can keep a rack like that restrained!");
				break;
			default:
				output("\n\nNerrasa’s kicking her feet up for now, crossed on the countertop and supporting a dataslate she’s reading between long gulps of a New Texan-branded protein shake." + (pc.isBimbo() ? " Oooh, that smells like cum! Yummy!" : ""));
				break;
		}
		
		output("\n\n<i>“Sup,”</i> she says, barely paying you any mind.");

		addButton(0, "Nerreasa", uvetoApproachNerrasaRepeat);
	}
	return false;
}

public function uvetoSearchAbandonedCamp():void
{
	clearOutput();
	
	output("This place has been abandoned for some time. Whoever was here before isn't coming back, you decide. You spend a few minutes tossing the tents, looking for anything of value the previous occupants might have left behind. There's nothing inside, save emptied containers and tattered scraps of cloth. Only when you glance into the fire pit do you catch a glimpse of something worth while: you lean over and pull a small, black amulet out of the dusty covering of snow.");

	output("\n\nYou hold it up to the light, eyeing the horse-shaped talisman warily. Wonder who left this... and why? Either way, you're fairly certain the creature it depicts is a leithan, and the amulet looks to be in good shape. With a shrug, you pocket it.");
	
	lootScreen = uvetoAbandonedCampLootCheck;
	flags["UVIP_J46_SEARCHED"] = 1;
	flags["SUPPRESS_COMBAT"] = 1;
	itemCollect([new LeithaCharm()]);
}

public function uvetoAbandonedCampLootCheck():void
{
	if (pc.accessory is LeithaCharm || pc.hasItemByType(LeithaCharm))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("You drop the charm back where you found it.");
	flags["UVIP_J46_SEARCHED"] = undefined;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoReactivateProbe():void
{
	clearOutput();

	output("You slide down into the blasted-out basin the probe’s sitting in and wrench off the remnants of its protective shell. Most of it was scattered around the snow topside, so there’s not much you have to contend with to get at the meaty contents of the MAXCORP probe.");
	
	if (pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nAh, looks like an easy fix. You flip your laser spanner out of your pack and give the probe a solid <i><b>WHACK</b></i> on the side. A moment passes, and then you hear the tell-tale booting noise of the electronics systems coming online.");
	}
	else
	{
		output("\n\nYou give the machine a long, thorough once-over, looking up parts and connections in your Codex, trying to deduce what went wrong... other than it explosively crashing, anyway. With a few helpful forum posts, you’re able to dig into the probe’s mechanical guts and and start pulling and rearranging things, trying to reboot it.");
	
		output("\n\nEventually, you manage to get it sorted out, and punch the power button inside it again. It takes a moment, but eventually the probe starts whirring and the systems begin coming online.");
	}
	
	output("\n\nThe probe reboots, tooting a cheery digital tune, and starts broadcasting. You easily link your Codex with it, letting you use it like a big relay to send and receive messages in the region.");
	
	output("\n\n<b>You can call for transit here now</b>!");

	flags["UVIP_R10_PROBE_ACTIVE"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}