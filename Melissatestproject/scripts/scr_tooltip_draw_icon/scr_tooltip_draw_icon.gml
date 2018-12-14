/// @param sprite
/// @param borderColor
/// @param insideColor
/// @param x
/// @param y

var spr = argument0;
var sprWidth = sprite_get_width(spr) / 2;
var sprHeight = sprite_get_height(spr) / 2;
var bColor = argument1;
var iColor = argument2;
var xx = argument3;
var yy = argument4;

draw_set_color(iColor);
draw_set_alpha(0.2);
draw_rectangle(xx - sprWidth, yy - sprHeight, xx + sprWidth, yy + sprHeight, false);
draw_set_alpha(1);

draw_set_color(bColor);
draw_rectangle(xx - sprWidth, yy - sprHeight, xx + sprWidth, yy + sprHeight, true);

draw_sprite(spr, 0, xx, yy);