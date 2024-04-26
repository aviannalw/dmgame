

if audio_is_playing(snd_game_music)
{audio_pause_sound(snd_game_music);
audio_play_sound(snd_game_music, 8, true);} else {audio_pause_sound(snd_menu_music);
audio_play_sound(snd_game_music, 8, true);}


