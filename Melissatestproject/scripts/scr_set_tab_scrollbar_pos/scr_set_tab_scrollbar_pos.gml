/// @param InventoryID
/// @param TabName
/// @param Position

// ERROR CHECKING
var inv = argument0;
if (inv == -1) return -1;

// GET THE TAB MAP
var tabMap = ds_map_find_value(inv, "tabMap");

// ERROR CHECKING
var dir = scr_split(string_upper(ds_map_find_value(tabMap, string(argument1) + "scrollPlacement")), "-");
if !(array_length_1d(dir) == 2) return -1;


// LEFT AND RIGHT
if (dir[0] == "LR") {
	var pos = argument2;
	var mx = ds_map_find_value(tabMap, string(argument1) + "scrollRight");
	var mn = ds_map_find_value(tabMap, string(argument1) + "scrollLeft");
	if (pos < mn) pos = mn;
	if (pos > mx) pos = mx;
	ds_map_replace(tabMap, string(argument1) + "scrollX", pos);
}

// UP AND DOWN
if (dir[0] == "UD") {
	var pos = argument2;
	var mx = ds_map_find_value(tabMap, string(argument1) + "scrollBottom");
	var mn = ds_map_find_value(tabMap, string(argument1) + "scrollTop");
	if (pos < mn) pos = mn;
	if (pos > mx) pos = mx;
	ds_map_replace(tabMap, string(argument1) + "scrollY", pos);
}