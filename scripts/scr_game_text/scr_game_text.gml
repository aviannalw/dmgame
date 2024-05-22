
function scr_game_text(_text_id){ //how to get different characters to say different things, could also be used for items?


talked_to_mechanic = false;
mechanic_count = 0;


talked_to_runner = false;
runner_count = 0;
inv = obj_item_manager.inv;
clue_1_appeared = false;
clue_2_appeared = false;
clue_3_appeared = false;
finished_rpapers = false;
finished_lpapers = false;
can_win = false;
if obj_text_box.exists = false {

switch(_text_id) {
	case"NPC 1"://to make a new thing that talks, add a new case and put the id in the instance creation code in the room
		scr_text("Hi! I'm NPC 1");
		scr_text("I swear I have more things to say...");
		scr_text("just kidding");
			scr_option("yeah", "NPC 1 - yes"); //NPC 1 -yes is the name of the option, could be called anything
			scr_option("nah", "NPC 1 - no");
		break;
		case "NPC 1 - yes"://if this case/option was picked, then the following text
			scr_text("awesome, you picked yes!");
			break;
		case "NPC 1 - no":
			scr_text("aw, you picked no :(");
			break;
	
	
//--------------welcome message!!!-----------------//
	case"welcome message":
		scr_text("Hello, Player! Your PI has left their data management plan to you.");
		scr_text("Your mission, should you choose to accept it: build a rocket with all six parts of the plan.");
		scr_text("Would you like a tutorial for the game controls?");
		scr_option("No, thanks", "no tutorial");
		scr_option("Yes, please", "yes tutorial");
		break;
		
		case"no tutorial":
		scr_text("Collect the rocket blueprints to begin.");
		break;
		
		case"yes tutorial":
		scr_text("Use the arrow keys or 'W', 'A', 'S', 'D' to move.");
		scr_text("Walk over items to pick them up.");
		scr_text("Click or use 'E' to interact with items and characters.");
		scr_text("Use the mouse, spacebar, or enter key and the arrow keys to select text options.");
		scr_text("Press 'P' to pause the game.");
		scr_text("Would you like to hear it again?");
		scr_option("I'm good", "no tutorial");
		scr_option("One more time?", "yes tutorial");
		break;
		
	case"blueprint pickup":
	scr_text("You picked up the rocket blueprints!");
	scr_text("Click and hold to view them.");
	break;
		
//--------------LEVEL 1-----------------//	
	
	case"pi paper pickup":
	scr_text("You picked up a message from your PI!");
	scr_text("Click and hold to read it.");
	break;
	
	case"see mechanic":
	scr_text("You see a rocket mechanic.")
	break;
	
	case"mechanic":
		scr_text("Hi! Your PI told me you might need some help with a rocket ship.");
		scr_text("Tell me about your data and I'll engrave one of these rocket bodies.");
		scr_text("What kind of data do you have?");
			scr_option("moon data", "mechanic - moon data")
			scr_option("space data", "mechanic - space data");
			scr_option("not sure", "mechanic - not sure");
		break;
		case"mechanic - moon data":
			lives -=1;
			audio_play_sound(snd_lose_life, 8, false);
			scr_text("Are you sure about that?");
			scr_text("What kind of data do you have?");
			scr_option("moon data", "mechanic - moon data")
			scr_option("space data", "mechanic - space data");
			scr_option("not sure", "mechanic - not sure");
		break;
		case"mechanic - not sure":
			scr_text("Didn't your PI leave instructions?");
			obj_speak_block.is_typing = false; //let's the dialogue loop again on click
		break;
		
		case"mechanic - space data":
			scr_text("My favorite kind!");
			scr_text("How much space data do you have?");
				scr_option("A butt-ton!", "mechanic - butt-ton");
				scr_option("1 KB", "mechanic - kb");
				scr_option("6 TB", "mechanic - tb");
		break;
		case"mechanic - butt-ton":
			lives -=1;
			audio_play_sound(snd_lose_life, 8, false);
			scr_text("Wow! Good luck with that! But I think that's too much for your rocket.");
			obj_speak_block.is_typing = false;
		break;
		case"mechanic - kb":
			scr_text("Are you sure about that?");
			scr_text("How much space data do you have?");
				scr_option("A butt-ton!", "mechanic - butt-ton");
				scr_option("1 KB", "mechanic - kb");
				scr_option("6 TB", "mechanic - tb");
		break;
		case"mechanic - tb":
			scr_text("That sounds about right.");
			scr_text("And what about sharing your 6 TB of space data?");
				scr_option("Share all of it.", "mechanic - all"); //there could be other options too
		break;
		case"mechanic - all":
			scr_text("Great.");
			scr_text("Anything else I need to know about your data?");
				scr_option("It's really weird.", "mechanic - weird");
				scr_option("The telescope.", "mechanic - telescope");
		break;
		case"mechanic - weird":
			scr_text("Huh...weird.");
			obj_speak_block.is_typing = false;
		break;
		case"mechanic - telescope":
		score +=10; audio_play_sound(snd_item_get, 8, false);
			scr_text("Thanks. That's really helpful.");
			scr_text("Well, let me get you settled. One second and I'll engrave this rocket body for you.");
			scr_text("Here you go!");
			if talked_to_mechanic = false && mechanic_count = 0 {
				instance_activate_object(inst_6D7DD6CC); //the rocket body
				instance_activate_object(inst_232FC494); //the second mechanic case, thank you umessage
				instance_deactivate_object(inst_614EC763);//delete this mechanic
				talked_to_mechanic = true;
				mechanic_count ++;
			}
		obj_speak_block.is_typing = false;//make mouse input work again
		instance_activate_object(inst_5167C0DC); //activate the level 1 complete message
		break;
		
		case"level 1 finish":
		scr_text("You described your data for someone else and how much will be shared.");
		scr_text("You also mentioned necessary equipment. Terrific!");
		break;
		
		case"mechanic thanks":
			scr_text("Thanks for coming and telling me about your data! I'm sure you have more pieces to find...");
			obj_speak_block.is_typing = false;
		break;
		
//--------------LEVEL 2-----------------//
		
		case"see runner":
		scr_text("You see someone on a run in the woods. He looks tired.");
		break;
		
		case"runner":
		scr_text("*pant* *pant* Oh, don't worry. I'm just resting.");
		scr_text("...");
		scr_text("......");
		scr_text("Say, aren't you working for that PI? He was in a hurry, but I heard your project is really cool.");
		scr_option("It is.", "agree");
		break;
		
		case"agree":
		scr_text("Do you think you'll make your data public after you finish?");
		scr_option("That's the plan!", "plan agree");
		break;
		
		case"plan agree":
		scr_text("Hey, that's awesome.");
		scr_text("While you're here, can I look at your blueprints so I can also get to your data?");
		if !array_contains(inv, global.item_list.blueprint)
		{ scr_text("Hey wait a second...you don't have any blueprints.");
			scr_text("How are you supposed to build a rocket ship without them?");
			obj_speak_block.is_typing = false;
			break;
		}
		scr_text("I'll trade you this thing I found...");
		scr_option("Take a Look.", "look");
		scr_option("No way!", "no way");
		break;
		
		case"look":
		score +=10; audio_play_sound(snd_item_get, 8, false);
		scr_text("...");
		scr_text("...... :)");
		scr_text("Oh, I get it! You're building a rocket ship. You'll need this thing then.");
		scr_text("Thanks for letting me catch my breath.");
		if talked_to_runner = false && runner_count = 0 {
				instance_activate_object(inst_100EB070);
				talked_to_runner = true;
				runner_count ++;
				obj_speak_block.is_typing = false;}
				instance_activate_object(inst_4D02E439); //the second runner case, thank you message
				instance_deactivate_object(inst_7A37C969);//delete this runner
				instance_activate_object(inst_68E30323); //activate level 2 finish message
		break;
		
		case"no way":
		scr_text("*shrugs* okay.");
		obj_speak_block.is_typing = false;
		break;
		
		case"runner thanks":
		scr_text("Thanks for telling me where to find your data. It's nice to know I could do what you did.");
		break;
		
		case"level 2 finish":
		scr_text("You told someone what they need to access your data for reuse. Good job!");
		break;
		
//--------------LEVEL 3-----------------//

		case"tree without axe":
		scr_text("You don't have an axe...");
		obj_speak_block.is_typing = false;
		break;
		
		case"cliff without ladder":
		scr_text("You don't have a ladder...");
		obj_speak_block.is_typing = false;
		break;

		case"clue 1":
		scr_text("Clue 1: Data standards ensure the pieces of the plan work together, like bolts on a rocket ship.");
		scr_text("Find the next clue in the northern flower field.");
		clue_1_appeared = true;
		if clue_1_appeared == true {instance_activate_object(inst_127BC255);}
		break;
		
		case"clue 2":
		scr_text("Which is not an example of a data standard?");
		scr_option("How data are generated", "generated");
		scr_option("Common guidelines", "guidelines");
		scr_option("Storage limits", "limits");
		break;
		
			case"generated":
			lives -=1;
			audio_play_sound(snd_lose_life, 8, false);
			scr_text("Think again!");
					scr_text("Which is not an example of a data standard?");
					scr_option("How data are generated", "generated");
					scr_option("Common guidelines", "guidelines");
					scr_option("Storage limits", "limits");
			break;
			
			
			case"guidelines":
			lives -=1;
			audio_play_sound(snd_lose_life, 8, false);
			scr_text("Nope!");
					scr_text("Which is not an example of a data standard?");
					scr_option("How data are generated", "generated");
					scr_option("Common guidelines", "guidelines");
					scr_option("Storage limits", "limits");
			break;
		
		
		case"limits":
		correct = true;
		if correct = true {
			scr_text("That's correct!");
			score +=10; audio_play_sound(snd_item_get, 8, false);
			scr_text("Find the next clue behind the lab");
			instance_deactivate_object(inst_127BC255);
			instance_activate_object(inst_1A4EB7F9); //show the axe
			clue_2_appeared = true;
			if clue_2_appeared == true {instance_activate_object(inst_5EE4A6E0);}
			break;
		}
		
		
		case"clue 3":
		scr_text("Sometimes there are no common standards for the type of data.");
		scr_text("In that case, document your work!");
		scr_text("now get cutting.");
		scr_text("I think I saw a rocket wing in the trees...");
			instance_activate_object(inst_5EE4A6E0); 
			instance_activate_object(inst_AB7EA7D); /*the ladder too*/ 
			instance_activate_object(inst_42C3C689); //and the message
			instance_activate_object(inst_FDA092F); //and the wing message
		break;
		
		case"clue 4":
		scr_text("does that tree look funny to you?");
		break;
		
		case"ladder pickup":
		scr_text("You found a ladder.");
		break;
		
		case"level 3 summary":
			scr_text("You learned about data standards and found another rocket piece!");
		break;
		
//--------------LEVEL 4-----------------//	
		
		case"welcome telescope":
		scr_text("Welcome to the telescope!");
		scr_text("Choose the repository planet that best fits with your data.");
		scr_text("Check your PI paper for guidelines.");
		scr_text("Click on a repository planet to view characteristics...");
		break;
		
		
		
		case"planet_1":
		scr_text("Name: Planet One         Storage: Up to 2 TB.");
		scr_text("Sensitivity: Accepts De-Identified Human Subject Data.         Cost: Free up to 2TB.");
		scr_text("Choose this repository planet?");
		scr_option("yes", "planet_1 selected");
		scr_option("No", "planet_1 unselected");
		break;
		
		case"planet_1 selected":
		scr_text("Your space data won't fit here! Try again.");
		obj_speak_block.is_typing = false;
		break;
		
		case"planet_1 unselected":
		scr_text("You did not choose this planet.");
		obj_speak_block.is_typing = false;
		break;
		
		case"planet_2":
		scr_text("Name: Planet Two         Storage: Up to 10 TB.");
		scr_text("Sensitivity: Not Suitable for Human Subject Data.         Cost: 1 Million Credits.");
		scr_text("Choose this repository planet?");
		scr_option("yes", "planet_2 selected");
		scr_option("No", "planet_2 unselected");
		break;
		
		case"planet_2 selected":
		scr_text("You don't have the budget for that!");
		obj_speak_block.is_typing = false;
		break;
		
		case"planet_2 unselected":
		scr_text("You did not choose this planet.");
		obj_speak_block.is_typing = false;
		break;
		
		case"planet_3":
		scr_text("Name: Planet Three       Storage: Up to 5PB.");
		scr_text("Sensitivity: Accepts All Data.                Cost: Free.");
		scr_text("Choose this repository planet?");
		scr_option("yes", "planet_3 selected");
		scr_option("No", "planet_3 unselected");
		break;
		
		case"planet_3 selected":
		scr_text("Great choice!");
		score +=10;
		audio_play_sound(snd_item_get, 8, false);
		scr_text("Exit the telescope and collect the rocket thruster.");
		obj_speak_block.is_typing = false;
		instance_activate_object(inst_7EC8DACA);
		instance_activate_object(inst_6D688131);
		break;
		
		case"planet_3 unselected":
		scr_text("You did not choose this planet.");
		obj_speak_block.is_typing = false;
		break;
		
		
		
//--------------LEVEL 5-----------------//	
		
		case"construction worker":
		scr_text("Sorry, boss. This bridge isn't done yet.");
		obj_speak_block.is_typing = false;
		break;
		
		
		
		case"begin level 5":
		scr_text("You thought about where to put your data and picked up the rocket thruster!");
		instance_deactivate_object(inst_6202ED68); //get rid of the worker and fix the bridge!
		instance_deactivate_object(inst_42635F0F);
		scr_text("Continue to the government building across the bridge.");
		break;
		
		case"govguy":
		scr_text("What?");
		scr_text("What do you want? Is it rocket stuff?");
		scr_text("*sigh* It's more rocket stuff, isn't it?");
		if !array_contains(inv, global.item_list.rocket_body_window_wing_engine) && ( !array_contains(inv, global.item_list.rocket_engine) && !array_contains(inv, global.item_list.rocket_left_wing) && !array_contains(inv, global.item_list.rocket_window) && !array_contains(inv, global.item_list.rocket_body) )
		{ scr_text("Hey, it doesn't look like you have enough of a plan to come talk to me yet.");
			scr_text("Come back when you have four rocket pieces.");
			obj_speak_block.is_typing = false;
			break;
		}
		
		scr_text("Okay, here's the deal bud.");
		scr_text("This data management stuff comes with a lot of reading, but the plan isn't so hard, right?");
		scr_text("So you'll hear me out, and then I'll send you on your way.");
		scr_text("I got a rocket wing with your name on it. ;)");
		scr_option("No thanks", "no thanks gov guy");
		scr_option("I'll listen","listen gov guy");
		break;
		
		case"no thanks gov guy":
		scr_text("Guess you won't finish the game, then...");
		obj_speak_block.is_typing = false;
		break;
		
		case"listen gov guy":
		scr_text("You have space data, right? Yeah, of course you do.");
		scr_text("Interspecies data gets a little complicated with consent forms, but we can skip that.");
		scr_text("I've heard you selected repository planet 3.");
		scr_text("Good choice, but there are intergalactic laws between this planet and that one."); 
		scr_option("What are they?", "what");
		break;
		
		case"what":
		scr_text("I'm not gonna sit here and tell them to you. No. Read, that's your job.");
		scr_text("Talk to me after you're done.");
		instance_activate_object(inst_restriction);
		obj_speak_block.is_typing = false;
		break;
		
		case"restriction papers":
		scr_text("You start on the restriction papers.");
		scr_text("...");
		scr_text("......");
		scr_text(".........");
		scr_text("...");
		score +=10; audio_play_sound(snd_item_get, 8, false);
		scr_text("You finish reading the restriction papers. That was long!");
		instance_deactivate_object(inst_restriction); //deactivate the papers
		finished_rpapers = true;
		if finished_rpapers == true {
		//deactivate the pervious version of the gov guy and activate the new one
		instance_deactivate_object(inst_gov_guy); //original gov guy
		instance_activate_object(inst_guy_after_restriction);} //gov guy after rpapers
		break;
		
		case"gov guy after rpapers":
		scr_text("What?");
		scr_text("Oh, you've finished. Here's the license agreement. Yes, you have to read it.");
		instance_activate_object(inst_license);
		break;
			
		case"license agreement":
		scr_text("You start on the license agreement.");
		scr_text("...");
		scr_text("......");
		score +=10; audio_play_sound(snd_item_get, 8, false);
		scr_text("You finish reading the license agreement. That wasn't so bad.");
		instance_deactivate_object(inst_license); //deactivate the papers
		finished_lpapers = true;
		if finished_lpapers == true
		{
		//deactivate the pervious version of the gov guy and activate the new one
		instance_deactivate_object(inst_guy_after_restriction); //gov guy rpapers
		instance_activate_object(inst_guy_after_license); //gov guy lpapers
		}
		break;
		
		case"gov guy after lpapers":
		scr_text("Well, everything seems to be in order.");
		scr_text("I'll send you on your way with this rocket piece. Oh, and there's a ladder by the cooler.");
		scr_text("You're gonna need it.");
		instance_activate_object(inst_right_wing); //activate the rocket piece
		//activate ladder
		instance_activate_object(inst_6DE0E3D7);
		break;
		
		
		//I haven't gottne the activation and deactivation of these objects and speakers right yet i should look at what i did for the mechanic think case
		//the obejcts should be deactivated in the player create event and activated here in text
		//maybe i need to delete them instead of deactivate when I'm finished?

		
		
//--------------LEVEL 6-----------------//


		case"astronaut 1":
		scr_text("Hi, I'm a grad student like you and a temporary replacement for the last pilot.");
		scr_text("(When the grant money runs out, I'm gone...)");
		scr_text("Pick me?");
		scr_option("Yes", "astro 1 yes");
		scr_option("No", "astro 1 no");
		break;
		
		case"astro 1 yes":
		scr_text("Awesome!");
		//play incorrect sound or lose a life sound
			lives -=1;
			audio_play_sound(snd_lose_life, 8, false);
		break;
		
		case"astro 1 no":
		scr_text("Alright. I wouldn't be able to see the project to the end anyway.");
		obj_speak_block.is_typing = false;
		break;
		
		case"astronaut 2":
		scr_text("Hi, I'm a seasoned pilot, almost retired, actually.");
		scr_text("Your PI is throwing a party for me next week.");
		scr_text("Pick me?");
		scr_option("Yes", "astro 2 yes");
		scr_option("No", "astro 2 no");
		break;
		
		case"astro 2 yes":
		scr_text("Great!");
		//play lose life sound
		lives -=1;
		audio_play_sound(snd_lose_life, 8, false);
		break;
		
		case"astro 2 no":
		scr_text("That's fair.");
		scr_text("I hope you'll come to my party, though.");
		obj_speak_block.is_typing = false;
		break;
		
		case"astronaut 3":
		scr_text("Hey, I remember you. Haven't seen you in the lab in a while.");
		scr_text("I bet you've been busy with those rocket ship pieces.");
		scr_text("I've actually been promoted to the data management plan board.");
		scr_text("Yep, I know how to fly a plan home.")
		scr_text("Pick me?");
		scr_option("Yes", "astro 3 yes");
		scr_option("No", "astro 3 no");
		break;
		
		case"astro 3 yes":
		scr_text("It's an honor.");
		score += 10;  audio_play_sound(snd_item_get, 8, false);
		can_win = true;
		//activate the rocket cone
		instance_activate_object(inst_3507286B);
		instance_activate_object(inst_441D2CE7);
	//	instance_deactivate_object(inst_no_rocket);
		instance_activate_object(inst_rocket_ready);
		break;
		
		case"astro 3 no":
		scr_text("Some other time, then.");
		obj_speak_block.is_typing = false; //this is here in case 3 isn't selected, which is wrong
		break;
		
		case"rocket add":
			scr_text("Congratulations! You chose a pilot that will ensure project sustainability...");
			scr_text("and collected all six pieces of the rocket!");
			scr_text("Click on the pieces to combine them in your inventory, and then it's blast off!");
		break;
		
		
		case"launchpad rocket ready":
		scr_text("Add your rocket to the launchpad?");
		scr_option("Add rocket", "place rocket");
		scr_option("Not yet", "not yet");
		obj_speak_block.is_typing = false;
		break;
		
		
		case"place rocket":
		if !array_contains(inv, global.item_list.rocket_complete)
		{scr_text("You don't have a complete rocket yet...");
			obj_speak_block.is_typing = false;
			break;}
		instance_deactivate_object(inst_rocket_ready);
		instance_activate_object(inst_rocket_on);
		array_delete(inv, 3, 1); //rocketship should be last anyway
		scr_text("You readied the rocket for launch.");
		obj_speak_block.is_typing = false;
		break;
		
		case"not yet":
		scr_text("You didn't add the rocket...");
		obj_speak_block.is_typing = false;
		break;
		
		case"launchpad rocket on":
		scr_text("Launch your data mangement plan?");
		obj_speak_block.is_typing = false;
		scr_option("Launch it!", "launch yes");
		scr_option("Actually...", "launch no");
		break;
		
		case"launch yes":
		//scr_text("Launch sequence initiated.");
		array_delete(inv, 0, 10); //delete player items
		instance_deactivate_object(inst_4670B8EA);
		audio_play_sound(snd_rocket_launch, 8, false);
		//rocket_launch = layer_sequence_create(sequences, 1345, 135, seq_rocket_launch);
	//	if layer_sequence_is_finished(rocket_launch)
		room_goto(win_room);
		break;
		
		case"launch no":
		obj_speak_block.is_typing = false;
		scr_text("You decided to wait a little longer...");
		break;

	
}
}
}
