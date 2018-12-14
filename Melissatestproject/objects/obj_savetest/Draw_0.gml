draw_self();
///Draw save slot label
draw_set_font(Orbitron);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x+192,y+48,string_hash_to_newline("Save Slot " + string(id-100000)));

