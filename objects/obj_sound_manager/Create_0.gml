global.master_volume = 1;
global.music_volume = 1;
global.sfx_volume = 1;



/*if !audio_is_playing(snd_game_music) && (room != menu_screen_room || room != int_room)
{
	audio_play_sound(snd_game_music, 100, true); //top priority
	audio_sound_gain(snd_game_music, global.music_volume, 0); //play it instantly
}