display_set_gui_size(288, 216);
draw_set_font(fnt_iconic_sm);
switch (room)
{

//----------------------LAB ROOM-----------------------//

case lab_room:
	draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 20, "SCORE: " + string(score));
	draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 30, "LIVES: " + string(lives));
	var _xx = 85;
	repeat(lives)
		{
		/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
		_xx += 20;	*/	
		}
if paused == true
	{
		if !surface_exists(paused_surf)
		 {
			if paused_surf == -1
			 {
			 instance_deactivate_all(true);
			}
		 paused_surf = surface_create(room_width, room_height);
			surface_set_target(paused_surf);
			draw_surface(application_surface, 0, 0);
			draw_sprite_tiled(spr_star_background, 0, 0, 0);
			surface_reset_target();
		 }
		 else
		{
			draw_surface(paused_surf, 0, 0);
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
				draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 20, "SCORE: " + string(score));
				draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 30, "LIVES: " + string(lives));
				var _xx = 85;
				repeat(lives)
					{
					/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
					_xx += 20;	*/	
					}
			draw_set_halign(fa_center);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2, "PAUSED", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_font(fnt_iconic_sm);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 50, "Press 'P' to Play", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 75, "Press 'Q' to Quit", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_halign(fa_left);
			if keyboard_check_pressed(ord("Q"))
			{ game_end();}
			//this button ended up not working how I wanted to 
			/* draw_sprite_ext(spr_menu_button, 0, 48, 160, 4, 4, 0, c_white, 1);
				draw_text(17, 161, "Resume"); //needs to be moved
			//code if mouse click on this area, then clear the stuff
				if mouse_x > 48 && mouse_x < 100 && mouse_y > 160 && mouse_y < 200 && mouse_check_button_pressed(mb_left) == true //if hovering and clicked on
						{
						room_goto(lab_room);
						}
				*/
			
		}
	}
    break; 


case open_world_room:
	draw_text(222, 20, "SCORE: " + string(score));
	draw_text(222, 30, "LIVES: " + string(lives));
	var _xx = 85;
	repeat(lives)
		{
		/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
		_xx += 20;	*/	
		}
if paused == true
	{
		if !surface_exists(paused_surf)
		 {
			if paused_surf == -1
			 {
			instance_deactivate_all(true);
			}
		 paused_surf = surface_create(room_width, room_height);
			surface_set_target(paused_surf);
			draw_surface(application_surface, 0, 0);
			draw_sprite_tiled(spr_star_background, 0, 0, 0);
			surface_reset_target();
		 }
		 else
		{
			draw_surface(paused_surf, 0, 0);
			draw_set_alpha(.5);
			draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
				draw_text(222, 20, "SCORE: " + string(score));
				draw_text(222, 30, "LIVES: " + string(lives));
				var _xx = 85;
				repeat(lives)
					{
					/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
					_xx += 20;	*/	
					}
			draw_set_halign(fa_center);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2, "PAUSED", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_font(fnt_iconic_sm);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 50, "Press 'P' to Play", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 75, "Press 'Q' to Quit", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_halign(fa_left);
			if keyboard_check_pressed(ord("Q"))
			{ game_end();}
		}
	}
    break; 		
		
		
		
		
case gov_room:
	draw_text(222, 20, "SCORE: " + string(score));
	draw_text(222, 30, "LIVES: " + string(lives));
	var _xx = 85;
	repeat(lives)
		{
		/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
		_xx += 20;	*/	
		}
		
if paused == true
	{
		if !surface_exists(paused_surf)
		 {
			if paused_surf == -1
			 {
			 instance_deactivate_all(true);
			}
		 paused_surf = surface_create(room_width, room_height);
			surface_set_target(paused_surf);
			draw_surface(application_surface, 0, 0);
			draw_sprite_tiled(spr_star_background, 0, 0, 0);
			surface_reset_target();
		 }
		 else
		{
			draw_surface(paused_surf, 0, 0);
			draw_set_alpha(.5);
			draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
				draw_text(222, 20, "SCORE: " + string(score));
				draw_text(222, 30, "LIVES: " + string(lives));
				var _xx = 85;
				repeat(lives)
					{
					/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
					_xx += 20;	*/	
					}
			draw_set_halign(fa_center);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2, "PAUSED", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_font(fnt_iconic_sm);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 50, "Press 'P' to Play", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 75, "Press 'Q' to Quit", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_halign(fa_left);
			if keyboard_check_pressed(ord("Q"))
			{ game_end();}
		}
	}
    break; 
	
	
	

case planet_room:
	draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 20, "SCORE: " + string(score));
	draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 30, "LIVES: " + string(lives));
	var _xx = 85;
	repeat(lives)
		{
		/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
		_xx += 20;	*/	
		}
		
if paused == true
	{
		if !surface_exists(paused_surf)
		 {
			if paused_surf == -1
			 {
			 instance_deactivate_all(true);
			}
		 paused_surf = surface_create(room_width, room_height);
			surface_set_target(paused_surf);
			draw_surface(application_surface, 0, 0);
			draw_sprite_tiled(spr_star_background, 0, 0, 0);
			surface_reset_target();
		 }
		 else
		{
			draw_surface(paused_surf, 0, 0);
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
				draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 20, "SCORE: " + string(score));
				draw_text(camera_get_view_x(view_camera[0]) + 222, camera_get_view_y(view_camera[0]) + 30, "LIVES: " + string(lives));
				var _xx = 85;
				repeat(lives)
					{
					/* I couldn't get this to work draw_sprite(spr_ladder, 0, _xx, 50); //placeholder spr
					_xx += 20;	*/	
					}
			draw_set_halign(fa_center);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2, "PAUSED", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_font(fnt_iconic_sm);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 50, "Press 'P' to Play", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_text_transformed_color(camera_get_view_width(view_camera[0]) / 2,camera_get_view_height(view_camera[0]) / 2 + 75, "Press 'Q' to Quit", 2, 2, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			draw_set_halign(fa_left);
			if keyboard_check_pressed(ord("Q"))
			{ game_end();}
		}
	}
    break; 

/* this code taken from https://gamemaker.io/en/tutorials/coffee-break-tutorials-pausing-your-game-gml
case rm_Start:
	draw_set_halign(fa_center);
    var c = c_yellow;
    draw_text_transformed_colour(room_width / 2, 100, "SPACE ROCKS", 3, 3, 0, c, c, c, c, 1);
    draw_text(room_width / 2, 200, 
    @"Score 1,000 points to win!

UP: move
LEFT/RIGHT: change direction
SPACE: shoot

>>PRESS ENTER TO START<<");
    draw_set_halign(fa_left);
    break;

case rm_Win:
    draw_set_halign(fa_center);
    var c = c_lime;
    draw_text_transformed_colour(room_width / 2, 200, "YOU WON!", 3, 3, 0, c, c, c, c, 1);
    draw_text(room_width / 2, 300, "PRESS ENTER TO RESTART");
    draw_set_halign(fa_left);
    break;

case rm_GameOver:
    draw_set_halign(fa_center);
    var c = c_red;
    draw_text_transformed_colour(room_width / 2, 150, "GAME OVER", 3, 3, 0, c, c, c, c, 1);
    draw_text(room_width / 2, 250, "FINAL SCORE: " + string(score));
    draw_text(room_width / 2, 300, "PRESS ENTER TO RESTART");
    draw_set_halign(fa_left);
    break;
	*/
}