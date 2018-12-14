draw_set_font(fnt_inventory);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(camera_get_view_x(view_camera[0])+50, room_height-50, "FPS: " +string(fps_real));