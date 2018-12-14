/// @param CellID
/// @param Description
/// @param [Static]
/// @param [X]
/// @param [Y]

// ERROR CHECKING
var cell = argument[0];
if (cell == -1) return -1;


// CELL INFORMATION
var cSprite = object_get_sprite(scr_get_cell_object(cell));
if (cSprite != -1) {
	var cSWidth = sprite_get_width(cSprite);
	var cSHeight = sprite_get_height(cSprite);
	var cSXoff = sprite_get_xoffset(cSprite);
	var cSYoff = sprite_get_yoffset(cSprite);
}

var cQuantity = scr_get_cell_quantity(cell);
var cName = object_get_name(scr_get_cell_object(cell));
var subtitle = "subtitle";

// SETUP SOME VARIABLES
if (argument_count > 2) {
	if (argument[2] == false) {
		var xx = mouse_x;
		var yy = mouse_y;
	} else {
		var xx = argument[3];
		var yy = argument[4];
	}
} else {
	var xx = mouse_x;
	var yy = mouse_y;
}
var padding = 10;
var width = 220;
var height = 150;
var dir = 0;
var bColor = make_color_rgb(123, 95, 56);
var iColor = make_color_rgb(200, 175, 135);

// Calculate the Direction
if ((xx + width) > (room_width - padding)) {
	dir = 1;
}
if ((yy + height) > (room_height - padding)) {
	if (dir == 0) {
		dir = 2;
	} else dir = 3;
}


// NON STATIC TOOLTIP
draw_set_color(iColor);
if (dir == 0) {
	scr_tooltip_draw_container(bColor, iColor, xx, yy, xx + width, yy + height);
	if (cSprite != -1) {
		scr_tooltip_draw_icon(cSprite, bColor, c_black, xx + cSXoff + padding, yy + cSYoff + padding);
		draw_set_color(c_black);
		scr_tooltip_draw_title(cName, c_black, fnt_inventory, xx + (padding * 2) + cSWidth, yy + padding);
		scr_tooltip_draw_subtitle(subtitle, c_black, fnt_subtitle, xx + (padding * 2) + cSWidth, yy + cSHeight);
		scr_tooltip_draw_description(argument[1], c_white, fnt_subtitle, width - (padding * 2), xx + padding, yy + cSHeight + (padding * 2));
		
		scr_tooltip_draw_quantity(cell, c_black, fnt_inventory, xx + width - padding, yy + height);
	}
}

if (dir == 1) {
	scr_tooltip_draw_container(bColor, iColor, xx, yy, xx - width, yy + height);
	if (cSprite != -1) {
		scr_tooltip_draw_icon(cSprite, bColor, c_black, xx - width + cSXoff + padding, yy + cSYoff + padding);
		draw_set_color(c_black);
		scr_tooltip_draw_title(cName, c_black, fnt_inventory, xx - width + (padding * 2) + cSWidth, yy + padding);
		scr_tooltip_draw_subtitle(subtitle, c_black, fnt_subtitle, xx - width + (padding * 2) + cSWidth, yy + cSHeight);
		scr_tooltip_draw_description(argument[1], c_white, fnt_subtitle, width - (padding * 2), xx - width + padding, yy + (padding * 2) + cSHeight);
		
		scr_tooltip_draw_quantity(cell, c_black, fnt_inventory, xx - padding, yy + height);
	}
}

if (dir == 2) {
	scr_tooltip_draw_container(bColor, iColor, xx, yy, xx + width, yy - height);
	if (cSprite != -1) {
		scr_tooltip_draw_icon(cSprite, bColor, c_black, xx + cSXoff + padding, yy - height + cSYoff + padding);
		draw_set_color(c_black);
		scr_tooltip_draw_title(cName, c_black, fnt_inventory, xx + (padding * 2) + cSWidth, yy - height + padding);
		scr_tooltip_draw_subtitle(subtitle, c_black, fnt_subtitle, xx + (padding * 2) + cSWidth, yy - height + cSHeight);
		scr_tooltip_draw_description(argument[1], c_white, fnt_subtitle, width - (padding * 2), xx + padding, yy - height + cSHeight + (padding * 2));
		
		scr_tooltip_draw_quantity(cell, c_black, fnt_inventory, xx + width - padding, yy);
	}
}

if (dir == 3) {
	scr_tooltip_draw_container(bColor, iColor, xx, yy, xx - width, yy - height);
	if (cSprite != -1) {
		scr_tooltip_draw_icon(cSprite, bColor, c_black, xx - width + cSXoff + padding, yy - height + cSYoff + padding);
		draw_set_color(c_black);
		scr_tooltip_draw_title(cName, c_black, fnt_inventory, xx - width + (padding * 2) + cSWidth, yy - height + padding);
		scr_tooltip_draw_subtitle(subtitle, c_black, fnt_subtitle, xx - width + (padding * 2) + cSWidth, yy - height + cSHeight);		
		scr_tooltip_draw_description(argument[1], c_white, fnt_subtitle, width - (padding * 2), xx - width + padding, yy - height + (padding * 2) + cSHeight);
		
		scr_tooltip_draw_quantity(cell, c_black, fnt_inventory, xx - padding, yy);
	}
}



// STATIC TOOLTIP