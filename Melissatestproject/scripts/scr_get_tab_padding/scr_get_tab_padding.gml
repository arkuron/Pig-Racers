/// @param InventoryID
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
return ds_map_find_value(tabMap, string(argument1) + "padding");