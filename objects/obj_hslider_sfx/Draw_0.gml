draw_self();

draw_set_color(c_white);
draw_set_font(fnt_iconic);
draw_set_halign(fa_center);
//draw_text(x, y + 10, "Bar Length: " + string(bar_length));
//draw_text(x, y + 30, "Left Limit: " + string(left_limit));
//draw_text(x, y + 40, "Right Limit: " + string(right_limit));
//draw_text(x, y+ 50, "Slider Position: " + string(y - left_limit));
draw_text(x, y + 15, string(global.sfx_volume*100) + "%");
//draw_text(x, y + 70, "Grabbed? " + string(grab));