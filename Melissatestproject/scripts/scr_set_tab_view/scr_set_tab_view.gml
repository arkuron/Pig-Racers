/// @param InventoryID
/// @param TabName
/// @param xStart
/// @param yStart
/// @param xEnd
/// @param yEnd

var inv = argument0;
if (inv == -1) return -1;
var tabMap = ds_map_find_value(inv, "tabMap");
ds_map_replace(tabMap, string(argument1) + "visXStart", argument2);
ds_map_replace(tabMap, string(argument1) + "visYStart", argument3);
ds_map_replace(tabMap, string(argument1) + "visXEnd", argument4);
ds_map_replace(tabMap, string(argument1) + "visYEnd", argument5);