/// @param Inventory
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
var cellGrid = ds_map_find_value(tabMap, argument1);

var gridW = ds_grid_width(cellGrid);
var gridH = ds_grid_height(cellGrid);

for (var i = 0; i < gridW; i++) {
	for (var j = 0; j < gridH; j++) {
		var cell = ds_grid_get(cellGrid, i, j);
		ds_map_replace(cell, "selected", false);
	}
}