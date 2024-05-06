if !mouse_check_button(mb_left)
{grab = false;}

if grab = false
{exit;}

else
{
	if ((mouse_x + xx) > left_limit) && ((mouse_x + xx) < right_limit)
	{ x = mouse_x + xx; }
	else if ((mouse_x + xx) < left_limit) //if it's too far left, stop at the limit
	{ x = left_limit; }
	else if ((mouse_x + xx) > right_limit)
	{ x = right_limit;}
	
}
percentage = round(((x - left_limit)/(right_limit - left_limit)) * 100);
global.music_volume = percentage/100;


audio_group_load(audio_music);
audio_group_set_gain(audio_music, global.music_volume, 0);