/// @param InventoryID
/// @param TabName
/// @param Padding

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
ds_map_replace(tabMap, string(argument1) + "padding", argument2);