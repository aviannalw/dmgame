if room = int_room
{audio_stop_all();}


if( room = menu_screen_room ) && !audio_is_playing(snd_menu_music)
	{
		audio_play_sound(snd_menu_music, 7, true);
		
	}
	else if room = settings_room
	{audio_stop_sound(snd_menu_music);}
	else if (room != menu_screen_room && room != settings_room && room != int_room) && !audio_is_playing(snd_game_music)
	{
		audio_pause_sound(snd_menu_music);
		audio_play_sound(snd_game_music, 7, true);
	}
