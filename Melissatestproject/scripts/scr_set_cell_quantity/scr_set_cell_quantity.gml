/// @param CellID
/// @param Quantity
/// @param AddReplace

var cell = argument0;
if (cell == -1) return -1;

if (argument2 == 0) ds_map_replace(cell, "quantity", ds_map_find_value(cell, "quantity") + argument1);
if (argument2 == 1) ds_map_replace(cell, "quantity", argument1);
