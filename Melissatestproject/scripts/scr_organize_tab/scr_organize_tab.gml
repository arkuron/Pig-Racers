/// @param InventoryID
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
var cellGrid = ds_map_find_value(tabMap, argument1);
var gridW = ds_grid_width(cellGrid);
var gridH = ds_grid_height(cellGrid);

var replaced = false;
for (var i = 0; i < gridW; i++) {
	for (var j = 0; j < gridH; j++) {
		var cell = ds_grid_get(cellGrid, i, j);
		var cObj = ds_map_find_value(cell, "object");
		var cLocked = ds_map_find_value(cell, "locked");
		var cQ = ds_map_find_value(cell, "quantity");
		if (!(cObj == -1) && (cLocked == false)) {
			for (var k = 0; k < gridW; k++) {
				for (var l = 0; l < gridH; l++) {
					var cell2 = ds_grid_get(cellGrid, k, l);
					var cObj2 = ds_map_find_value(cell2, "object");
					var cLocked2 = ds_map_find_value(cell2, "locked");
					if ((cObj2 == -1) && (replaced == false) && (cLocked2 == false)) {
						scr_set_cell_object(cell2, cObj);
						scr_set_cell_quantity(cell2, cQ, 1);
						scr_set_cell_object(cell, -1);
						scr_set_cell_quantity(cell, 0, 1);
						replaced = true;
					}
				}
			}
		}
		replaced = false;
	}
}