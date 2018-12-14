/// @param IventoryID

// Find the Tab
var inv = argument0;
var invVisible = ds_map_find_value(inv, "visible");
if (invVisible == false) exit;

var tabMap	= ds_map_find_value(inv, "tabMap");
var tabList = ds_map_find_value(inv, "tabList");

// DRAW THE CURRENT TAB
for (var k = 0; k < ds_list_size(tabList); k++) {
	var cTabName	= ds_list_find_value(tabList, k);
	var cTab		= ds_map_find_value(tabMap, cTabName);
	var tVisible	= ds_map_find_value(tabMap, string(cTabName) + "visible");
	
	if (tVisible == true) {
		var tX				= ds_map_find_value(tabMap, string(cTabName) + "x");
		var tY				= ds_map_find_value(tabMap, string(cTabName) + "y");
		var tHeight			= ds_map_find_value(tabMap, string(cTabName) + "height");
		var tWidth			= ds_map_find_value(tabMap, string(cTabName) + "width");
		var tCellSize		= ds_map_find_value(tabMap, string(cTabName) + "cellSize");
		var tPadding		= ds_map_find_value(tabMap, string(cTabName) + "padding");
		var tMaxStack		= ds_map_find_value(tabMap, string(cTabName) + "maxStack");
		var tQDisplay		= ds_map_find_value(tabMap, string(cTabName) + "qDisplay");
		var tScrollEnabled	= ds_map_find_value(tabMap, string(cTabName) + "scrollEnabled");
		
		var tVisXStart		= ds_map_find_value(tabMap, string(cTabName) + "visXStart");
		var tVisXEnd		= ds_map_find_value(tabMap, string(cTabName) + "visXEnd");
		var tVisYStart		= ds_map_find_value(tabMap, string(cTabName) + "visYStart");
		var tVisYEnd		= ds_map_find_value(tabMap, string(cTabName) + "visYEnd");
		var tVisWidth		= tVisXEnd - tVisXStart;
		var tVisHeight		= tVisYEnd - tVisYStart;
		
		var iWidth			= (tVisWidth * tCellSize) + ((tVisWidth + 1) * tPadding);
		var iHeight			= (tVisHeight * tCellSize) + ((tVisHeight + 1) * tPadding);


		// SETUP DRAWING PROPERTIES
		draw_set_color(c_black);
		draw_set_font(fnt_inventory);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);

		// #################### SCROLLBAR #################### //
		if (tScrollEnabled == true) {
			// ERROR CHECKING
			var split = scr_split(ds_map_find_value(tabMap, string(cTabName) + "scrollPlacement"), "-");
			if (array_length_1d(split) == 2) {
			
				// SETUP SOME VARIABLES
				var tSDir		= split[0];
				var tSPlace		= split[1];
				var tSTY		= 0;
				var tSTX		= 0;
				
				// LEFT AND RIGHT
				if (tSDir == "LR") {
					var dist		= scr_get_tab_view_pixel_width(inv, cTabName);
					var steps		= scr_get_tab_grid_width(inv, cTabName) - scr_get_tab_view_width(inv, cTabName);
					var stepDist	= (dist / (steps + 1));
					var tSScale		= (stepDist / sprite_get_height(spr_scrollbar));
					var tScrollX	= ds_map_find_value(tabMap, string(cTabName) + "scrollX");
					tSTX = (tX - (tCellSize / 2) - tPadding) + tScrollX;
					
					// TOP PALCEMENT
					if (tSPlace == "TOP") {
						tSTY = tY - (tCellSize / 2) - (sprite_get_width(spr_scrollbar) / 2) - tPadding;
					}
					
					// BOTTOM PLACEMENT
					if (tSPlace == "BOTTOM") {
						tSTY = tY + iHeight - (tCellSize / 2) + (tPadding * 2);
					}
					draw_sprite_ext(spr_scrollbar, 0, tSTX, tSTY, 1, tSScale, 90, c_white, 1);
				}
				
				// UP AND DOWN
				if (tSDir == "UD") {
					var dist		= scr_get_tab_view_pixel_height(inv, cTabName);
					var steps		= scr_get_tab_grid_height(inv, cTabName) - scr_get_tab_view_height(inv, cTabName);
					var stepDist	= (dist / (steps + 1));
					var tSScale		= (stepDist / sprite_get_height(spr_scrollbar));
					var tScrollY = ds_map_find_value(tabMap, string(cTabName) + "scrollY");
					tSTY = (tY - tPadding) + tScrollY - (tCellSize / 2);
					
					// LEFT PLACEMENT
					if (tSPlace == "LEFT") {
						tSTX = tX - (tCellSize / 2) - (tPadding * 2) - sprite_get_width(spr_scrollbar);
					}
					
					// RIGHT PLACEMENT
					if (tSPlace == "RIGHT") {
						tSTX = (tX + iWidth + tPadding) - (tCellSize / 2) - (sprite_get_width(spr_scrollbar) / 2);
					}
					draw_sprite_ext(spr_scrollbar, 0, tSTX, tSTY, 1, tSScale, 0, c_white, 1);			
				}
			}
		}
		// #################### END SCROLLBAR #################### //


		// DRAW TAB BACKGROUND
		draw_sprite_ext(spr_background, 0, tX + (iWidth / 2) - (tCellSize / 2) - tPadding, tY + (iHeight / 2) - (tCellSize / 2) - tPadding, iWidth / 32, iHeight / 32, 0, c_white, 1);
	
		// SETUP SOME VARIABLES FOR THE TAB NAME
		var strWidth	= string_width(string(cTabName));
		var scale		= 1;
		var scrollOffset= 0;
		
		// GET THE SCROLL BAR OFFSET
		if (tScrollEnabled == true) {
			if (array_length_1d(split) == 2) {
				if (split[0] = "LR" && split[1] = "TOP") scrollOffset = sprite_get_width(spr_scrollbar) + tPadding;
			}
		}
		
		// SET THE STRING SCALE
		if (strWidth > iWidth - (tPadding * 2)) scale = (iWidth - (tPadding * 2)) / strWidth;
		
		// DRAW THE TAB NAME
		draw_text_transformed(tX - (tCellSize / 2), tY - (tCellSize / 2) - tPadding - string_height("ABCD") - scrollOffset, cTabName, scale, scale, 0);

		// DRAW CELLS INSIDE VIEW
		draw_set_font(fnt_cell);
		draw_set_valign(fa_middle);
		for (var w = tVisXStart; w < tVisXEnd; w++) {
			for (var h = tVisYStart; h < tVisYEnd; h++) {
			
				// GET THE CELL & PROPERTIES
				var cell		= ds_grid_get(cTab, w, h);
				var cObj		= ds_map_find_value(cell, "object");
				var cQuantity	= ds_map_find_value(cell, "quantity");
				var cX			= ds_map_find_value(cell, "x");
				var cY			= ds_map_find_value(cell, "y");
				var cLocked		= ds_map_find_value(cell, "locked");
				var cSelected	= ds_map_find_value(cell, "selected");
		
				// GET CELL POSITION
				var xx = tX + ((w - tVisXStart) * tCellSize) + ((w - tVisXStart) * tPadding)
				var yy = tY + ((h - tVisYStart) * tCellSize) + ((h - tVisYStart) * tPadding)
		
				// DRAW CELL SPRITE
				var size = sprite_get_width(spr_cell);
				if (cLocked == false) {
					draw_sprite_ext(spr_cell, 0, xx, yy, tCellSize / size, tCellSize / size, 0, c_white, 1);
				} else {
					draw_sprite_ext(spr_cell, 0, xx, yy, tCellSize / size, tCellSize / size, 0, make_color_rgb(200, 200, 200), 1);
					draw_sprite_ext(spr_lock, 0, xx, yy, tCellSize / size, tCellSize / size, 0, c_white, 1);
				}
		
				// DRAW CELL OBJECT
				if (cObj != -1 && object_exists(cObj)) {
					var size = sprite_get_width(object_get_sprite(cObj));
					draw_sprite_ext(object_get_sprite(cObj), 0, xx, yy, tCellSize / size, tCellSize / size, 0, c_white, 1);
					if (cLocked == true) draw_sprite_ext(spr_lock, 0, xx, yy, tCellSize / size, tCellSize / size, 0, c_white, 1);
				}
		
				// DRAW CELL SELECTION IDENTIFIER
				if (cSelected == true) draw_sprite_ext(spr_selected, 0, xx, yy, tCellSize / sprite_get_width(spr_selected), tCellSize / sprite_get_width(spr_selected), 0, c_white, 1);
		
				// DRAW CELL QUANTITY
				strWidth = string_width(string(cQuantity));
				scale = 1;
				if (strWidth > tCellSize) scale = tCellSize / strWidth;
				if (tQDisplay == 0) draw_text_transformed(xx - (tCellSize / 2), yy + (tCellSize / 2) - (string_height("1234") / 2), cQuantity, scale, scale, 0);
				if (tQDisplay == 1) {
					if !(cObj == -1) draw_text_transformed(xx - (tCellSize / 2), yy + (tCellSize / 2) - (string_height("1234") / 2), cQuantity, scale, scale, 0);
				}
				if (tQDisplay == 2) {
					if !(cObj == -1) {
						if ((mouse_x > cX) && (mouse_x < cX + tCellSize) && (mouse_y > cY) && (mouse_y < cY + tCellSize)) {
							draw_text_transformed(xx - (tCellSize / 2) + 1, yy + (tCellSize / 2) - (string_height("1234") / 2), cQuantity, scale, scale, 0);
						}
					}
				}
			}
		}
	}
}