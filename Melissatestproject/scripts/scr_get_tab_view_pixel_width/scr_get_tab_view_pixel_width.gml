/// @param InventoryID
/// @param TabName

var inv = argument0;
if (inv == -1) return -1;

var tabMap = ds_map_find_value(inv, "tabMap");
var cTN = argument1;
var cTW = scr_get_tab_view_width(inv, cTN);
var cTP = scr_get_tab_padding(inv, cTN);
var cTCS = scr_get_tab_cellSize(inv, cTN);

return (cTW * cTCS) + ((cTW + 1) * cTP);