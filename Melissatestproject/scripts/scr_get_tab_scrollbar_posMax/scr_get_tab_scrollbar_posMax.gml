/// @param InventoryID
/// @param TabName

// ERROR CHECKING
var inv = argument0;
if (inv == -1) return -1;

// GET THE TAB MAP
var tabMap = ds_map_find_value(inv, "tabMap");

// ERROR CHECKING
var dir = scr_split(string_upper(ds_map_find_value(tabMap, string(argument1) + "scrollPlacement")),"-");
if !(array_length_1d(dir) == 2) return -1;

// SET THE VALUES
if (dir[0] == "LR") return ds_map_find_value(tabMap, string(argument1) + "scrollRight");
if (dir[0] == "UD") return ds_map_find_value(tabMap, string(argument1) + "scrollBottom");