/// @param InventoryID
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
var cTN = argument1;
var cTH = scr_get_tab_grid_height(inv, cTN);
var cTP = scr_get_tab_padding(inv, cTN);
var cTCS = scr_get_tab_cellSize(inv, cTN);

return (cTH * cTCS) + ((cTH + 1) * cTP);