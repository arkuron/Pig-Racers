/// @param InventoryID
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
var cellGrid = ds_map_find_value(tabMap, argument1);
var maxStack = ds_map_find_value(tabMap, string(argument1) + "maxStack");
var gridW = ds_grid_width(cellGrid);
var gridH = ds_grid_height(cellGrid);
var found = false;
// Loop though the grid until we find an object.
// Once we find on object, loop through the grid again to find another object
// if the objects are identical, move the contents of the 2nd item to the first.
// Stack up to the max stack and stopping.
// then delete the 2nd item if we could stack fully.
for (var i = 0; i < gridW; i++) {
	for (var j = 0; j < gridH; j++) {
		var cell = ds_grid_get(cellGrid, i, j);
		var cObj = ds_map_find_value(cell, "object");
		var cLocked = ds_map_find_value(cell, "locked");
		if (!(cObj == -1) && (cLocked == false)) {
			var cQ = ds_map_find_value(cell, "quantity");
			for (var k = 0; k < gridW; k++) {
				for (var l = 0; l < gridH; l++) {
					if !((k == i) && (l == j)) {
						var cell2 = ds_grid_get(cellGrid, k, l);
						var cObj2 = ds_map_find_value(cell2, "object");
						var cLocked2 = ds_map_find_value(cell2, "locked");
						if ((cObj2 == cObj) && (cLocked2 == false)) {
							var cQ2 = ds_map_find_value(cell2, "quantity");
							if (cQ + cQ2 <= maxStack) {
								scr_set_cell_quantity(cell, cQ2, 0);
								scr_set_cell_quantity(cell2, 0, 1);
								scr_set_cell_object(cell2, -1);
							} else {
								if !(cQ == maxStack || cQ2 == maxStack) {
									scr_set_cell_quantity(cell, maxStack, 1);
									scr_set_cell_quantity(cell2, (cQ + cQ2) - maxStack, 1);
								}
							}
						}
					}
				}
			}
		}
	}
}