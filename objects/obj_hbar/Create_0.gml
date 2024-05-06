//randomize();

image_xscale = random_range(.5, 1);
image_yscale = image_xscale;

right_limit = obj_hbar.x + (sprite_width) - (image_xscale*10);
left_limit = obj_hbar.x + (image_xscale*10);


a = instance_create_depth(x, y, 999, obj_hslider);
a.image_xscale = image_xscale;
a.image_yscale = image_yscale;
a.bar_length = sprite_get_width(spr_volume_strength);
a.right_limit = right_limit;
a.left_limit = left_limit;

a.percentage = global.music_volume*100;
a.x = image_xscale;//a.left_limit + ((a.percentage/100) * (a.right_limit-a.left_limit));
a.clicked = false;