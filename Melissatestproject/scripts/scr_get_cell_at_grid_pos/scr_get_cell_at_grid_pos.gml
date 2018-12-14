/// @param InventoryID
/// @param TabName
/// @param GridX
/// @param GridY

var inv = argument0
if (inv == -1) return -1;

var cTM = ds_map_find_value(argument0, "tabMap");
var cTL = ds_map_find_value(argument0, "tabList");

if (ds_list_find_value(cTL, argument1) == -1) return -1;

var cTN = argument1;
var xx = argument2;
var yy = argument3;
var cTW = ds_map_find_value(cTM, cTN + "width");
var cTH = ds_map_find_value(cTM, cTN + "height");

if (argument1 >= cTW) xx = cTW - 1;
if (argument2 >= cTH) yy = cTH - 1;
	
var cTG = ds_map_find_value(cTM, cTN);
var cC = ds_grid_get(cTG, xx, yy);
return cC;