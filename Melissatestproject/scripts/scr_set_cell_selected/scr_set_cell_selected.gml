/// @param CellID
/// @param Selected
/// @param AllowMulti

var cell = argument0;
if (cell == -1) return -1;

if (argument2 == true) {
	var cLocked = ds_map_find_value(cell, "locked");
	if (cLocked == false) ds_map_replace(cell, "selected", argument1);
} else {
	var tabMap = ds_map_find_value(ds_map_find_value(cell, "inv"), "tabMap");
	var cellGrid = ds_map_find_value(tabMap, ds_map_find_value(cell, "tabName"));
	var gridW = ds_grid_width(cellGrid);
	var gridH = ds_grid_height(cellGrid);
	
	// Set all cells in the grid to "Deselected"
	// Then select the current cell
	for (var i = 0; i < gridW; i++) {
		for (var j = 0; j < gridH; j++) {
			var cell = ds_grid_get(cellGrid, i, j);
			var cLocked = ds_map_find_value(cell, "locked");
			if (cLocked == false) ds_map_replace(cell, "selected", false);
		}
	}
	ds_map_replace(argument0, "selected", argument1);
}