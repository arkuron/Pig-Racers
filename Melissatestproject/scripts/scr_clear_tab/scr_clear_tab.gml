/// @param InventoryID
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
var cellGrid = ds_map_find_value(tabMap, argument1);
var gridW = ds_grid_width(cellGrid);
var gridH = ds_grid_height(cellGrid);

// Loop through the grid and change EVERYTHING back to NO OBJECT and NO QUANTITY
for (var i = 0; i < gridW; i++) {
	for (var j = 0; j < gridH; j++) {
		var cell = ds_grid_get(cellGrid, i, j);
		scr_set_cell_object(cell, -1);
		scr_set_cell_quantity(cell, 0, 1);
		scr_set_cell_locked(cell, false);
		scr_set_cell_selected(cell, false, 0);
	}
}