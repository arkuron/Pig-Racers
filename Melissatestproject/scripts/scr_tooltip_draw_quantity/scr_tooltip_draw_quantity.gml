/// @param CellID
/// @param color
/// @param font
/// @param x
/// @param y

var cell = argument0;
if (cell == -1) return -1;

var col = argument1;
var fnt = argument2;
var xx = argument3;
var yy = argument4

var q = ds_map_find_value(cell, "quantity");
var inv = ds_map_find_value(cell, "inv");
var tabName = ds_map_find_value(cell, "tabName");
var tabMap = ds_map_find_value(inv, "tabMap");
var maxQ = ds_map_find_value(tabMap, string(tabName) + "maxStack");


draw_set_color(col);
draw_set_font(fnt);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(xx, yy, string(q) + " / " +string(maxQ));