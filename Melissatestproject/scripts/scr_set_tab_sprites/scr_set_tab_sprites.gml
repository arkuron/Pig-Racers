/// @param InventoryID
/// @param TabName
/// @param CellSprite
/// @param BackgroundSprite
/// @param SelectedSprite
/// @param LockedSprite

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
ds_map_replace(tabMap, string(argument1) + "cellSprite", argument2);
ds_map_replace(tabMap, string(argument1) + "backgroundSprite", argument3);
ds_map_replace(tabMap, string(argument1) + "selectedSprite", argument4);
ds_map_replace(tabMap, string(argument1) + "lockedSprite", argument5);