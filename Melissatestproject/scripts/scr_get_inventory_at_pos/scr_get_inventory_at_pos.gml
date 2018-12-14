/// @param X
/// @param Y

var xx = argument0;
var yy = argument1;
var result = -1;

// Loop through all of the inventories and see if our mouse is inside the bounds
for (var i = 0; i < ds_list_size(obj_inventory_controller.masterInvList); i++) {
	var inv = ds_list_find_value(obj_inventory_controller.masterInvList, i);
	var tabMap = ds_map_find_value(inv, "tabMap");
	var tabList = ds_map_find_value(inv, "tabList");
	
	for (var j = 0; j < ds_list_size(tabList); j++) {
		// Get tab Properties
		var TabName = ds_list_find_value(tabList, j);
		var tX = ds_map_find_value(tabMap, string(TabName) + "x");
		var tY = ds_map_find_value(tabMap, string(TabName) + "y");
		var tCellSize = ds_map_find_value(tabMap, string(TabName) + "cellSize");
		var tPadding = ds_map_find_value(tabMap, string(TabName) + "padding");
		var tVisible = ds_map_find_value(tabMap, string(TabName) + "visible");
	
		if (tVisible == true) {
			var xStart = tX - (tCellSize / 2) - tPadding;
			var yStart = tY - (tCellSize / 2) - tPadding;
			var xEnd = xStart + scr_get_tab_view_pixel_width(inv, TabName);
			var yEnd = yStart + scr_get_tab_view_pixel_height(inv, TabName);
	
			// Check the bounding boxes
			if (xx >= xStart && xx <= xEnd && yy >= yStart && yy <= yEnd) {
				result = inv;
			}
		}
	}
}

return result;