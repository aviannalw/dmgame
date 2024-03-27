
function scr_game_text(_text_id){ //how to get different characters to say different things, could also be used for items?

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
	
	
	case"rocket piece 1":
		scr_text("Hi! I'm rocket piece 1");
		scr_text("you need me!");
		scr_text("just kidding");
	break;
}

}