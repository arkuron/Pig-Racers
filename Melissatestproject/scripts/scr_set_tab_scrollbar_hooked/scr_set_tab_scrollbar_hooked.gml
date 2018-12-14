/// @param InventoryID
/// @param TabName
/// @param Hooked

/*
	Setting the hook means the scrollbars XY will correspond to the mouse until you unhoock it.
*/


var inv = argument0;
if (inv == -1) return -1;
var tabMap = ds_map_find_value(inv, "tabMap");
ds_map_replace(tabMap, string(argument1) + "scrollHooked", argument2);