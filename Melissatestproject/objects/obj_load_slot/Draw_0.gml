draw_self();
//Draw load slot label
draw_set_font(Orbitron);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x+192,y+48,string_hash_to_newline("Load Slot " + string(id-100003)));

//Display save thumbnail for this slot on hover
if distance_to_point(mouse_x,mouse_y) < 1 {
   //Load thumbnail
   if !sprite_exists(spr_thumb) {
      spr_thumb = edgefs_load_screenshot("demo" + string(id-100003) + ".dat");
   }
   //Draw thumbnail
   if sprite_exists(spr_thumb) {
      draw_sprite_stretched(spr_thumb,-1,obj_frame.x+2,obj_frame.y+4,384,216);
   }
   
   //Display date, time, and time played
   draw_text_color(obj_frame.x+197,obj_frame.y+112,string_hash_to_newline("Date: " + edgefs_load_time("demo" + string(id-100003) + ".dat") + " " + edgefs_load_date("demo" + string(id-100003) + ".dat") + "#Total Time: " + edgefs_load_timeplayed("demo" + string(id-100003) + ".dat", false) + "####(Right click to delete)"),c_black,c_black,c_black,c_black,0.5);
   draw_text(obj_frame.x+195,obj_frame.y+110,string_hash_to_newline("Date: " + edgefs_load_time("demo" + string(id-100003) + ".dat") + " " + edgefs_load_date("demo" + string(id-100003) + ".dat") + "#Total Time: " + edgefs_load_timeplayed("demo" + string(id-100003) + ".dat", false) + "####(Right click to delete)"));
} else {
   //Unload thumbnail when not in use
   if sprite_exists(spr_thumb) {
      sprite_delete(spr_thumb);
   }
}

