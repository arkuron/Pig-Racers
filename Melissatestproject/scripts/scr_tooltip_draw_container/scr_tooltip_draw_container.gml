/// @param borderColor
/// @param insideColor
/// @param x
/// @param y
/// @param x1
/// @param y1

draw_set_color(argument1);
draw_set_alpha(0.9);
draw_rectangle(argument2, argument3, argument4, argument5, false);
draw_set_alpha(1);

draw_set_color(argument0);
draw_rectangle(argument2, argument3, argument4, argument5, true);