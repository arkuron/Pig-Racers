/// @param CellID

var cell = argument0;
if (cell == -1) return -1;

return ds_map_find_value(cell, "locked");