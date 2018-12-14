/// @param InventoryID
/// @param TabName
/// @param X
/// @param Y

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
ds_map_replace(tabMap, string(argument1) + "x", argument2);
ds_map_replace(tabMap, string(argument1) + "y", argument3);