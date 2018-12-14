/// @param text
/// @param color
/// @param font
/// @param x
/// @param y

var str = argument0;
var col = argument1;
var fnt = argument2;
var xx = argument3;
var yy = argument4;

draw_set_color(col);
draw_set_font(fnt);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(xx, yy, str);