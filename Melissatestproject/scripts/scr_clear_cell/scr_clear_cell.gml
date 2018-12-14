/// @param CellID
/// @param Default

var cell = argument0;
if (cell == -1) return -1;

ds_map_replace(cell, "quantity", 0);
ds_map_replace(cell, "object", -1);

if (argument1 == true) {
	ds_map_replace(cell, "locked", false);
	ds_map_replace(cell, "selected", false);
}