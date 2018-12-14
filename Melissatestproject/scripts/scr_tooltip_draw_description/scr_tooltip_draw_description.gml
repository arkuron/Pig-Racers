/// @param text
/// @param color
/// @param font
/// @param width
/// @param x
/// @param y

var str = argument0;
var col = argument1;
var fnt = argument2;
var width = argument3;
var xx = argument4;
var yy = argument5;

draw_set_color(col);
draw_set_font(fnt);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(xx, yy, str, string_height("ABCDE"), width);