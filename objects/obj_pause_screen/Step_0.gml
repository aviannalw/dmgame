if room == lab_room || open_world_room || planet_room || gov_room
{
if 
keyboard_check_direct(ord("P")) || keyboard_check_pressed(vk_escape) //if this is pressed, pause the game
    {
   
	paused = !paused;
    if paused == false
        {
       audio_master_gain(1);
	   instance_activate_all();
        surface_free(paused_surf);
                paused_surf = -1;
        }
    }
if paused == true
    {
	audio_master_gain(.4); //dampens the volume of the music if the pause screen is up
    alarm[0]++;
    alarm[1]++;
    }
}