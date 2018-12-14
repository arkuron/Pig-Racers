/// @param X
/// @param Y

var xx = argument0;
var yy = argument1;
var cCX = -1;
var cCY = -1;

var cI = scr_get_inventory_at_pos(xx, yy);
if !(cI == -1) {
	var cTM = ds_map_find_value(cI, "tabMap");
	var cTN = scr_get_tab_at_pos(xx, yy);
	var cTX = ds_map_find_value(cTM, string(cTN) + "x");
	var cTY = ds_map_find_value(cTM, string(cTN) + "y");
	var cTCS = ds_map_find_value(cTM, string(cTN) + "cellSize");
	var cTW = ds_map_find_value(cTM, string(cTN) + "width");
	var cTH = ds_map_find_value(cTM, string(cTN) + "height");
	var cTP = ds_map_find_value(cTM, string(cTN) + "padding");
	var cTV = ds_map_find_value(cTM, string(cTN) + "visible");
	if (cTV == true) {
		var cTVisXStart = ds_map_find_value(cTM, string(cTN) + "visXStart");
		var cTVisYStart = ds_map_find_value(cTM, string(cTN) + "visYStart");
	
		cCX = (((mouse_x - cTX) + (cTCS / 2)) div (cTCS + cTP)) + cTVisXStart;
		cCY = (((mouse_y - cTY) + (cTCS / 2)) div (cTCS + cTP)) + cTVisYStart;
		if (cCX >= cTW) cCX = cTW - 1;
		if (cCY >= cTH) cCY = cTH - 1;
	
		var cTG = ds_map_find_value(cTM, cTN);
		var cC = ds_grid_get(cTG, cCX, cCY);
		return cC;
	} else {
		return -1;
	}
} else {
	return -1;
}