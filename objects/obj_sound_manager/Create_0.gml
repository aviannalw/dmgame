audio_group_load(audio_music);
audio_group_load(audio_sfx);
audio_group_set_gain(audio_music, 1, 0);
audio_group_set_gain(audio_sfx, 1, 0);



global.master_volume = 1;
global.music_volume = audio_group_get_gain(audio_music);
global.sfx_volume = audio_group_get_gain(audio_sfx);



/*if !audio_is_playing(snd_game_music) && (room != menu_screen_room || room != int_room)
{
	audio_play_sound(snd_game_music, 100, true); //top priority
	audio_sound_gain(snd_game_music, global.music_volume, 0); //play it instantly
}