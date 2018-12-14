/// @param CellID
/// @param Locked

var cell = argument0;
if (cell == -1) return -1;

ds_map_replace(cell, "locked", argument1);