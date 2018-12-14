/// @param InventoryID	0
/// @param TabName		1
/// @param Enabled		2
/// @param Placement	3
/// @param Start		4
/// @param Finish		5
/// @param Position		6


/*
	PLACEMENT ARGUMENT:
	"LR-TOP"			- Scroll direction is left-right and bar is placed on TOP
	"LR-BOTTOM"		- Scroll direction is left-right and bar is placed on BOTTOM
	"UD-LEFT"		- Scroll direction is up-down and bar is placed on LEFT
	"UD-RIGHT"		- Scroll direction is up-down and bar is placed on RIGHT
*/


// ERROR CHECKING
var inv = argument0;
if (inv == -1) return -1;

// GET THE TAB MAP AND SET THE SCROLL ENABLED / DISABLED
var tabMap = ds_map_find_value(inv, "tabMap");
ds_map_replace(tabMap, string(argument1) + "scrollEnabled", argument2);

// ERROR CHECKING
var dir = scr_split(string_upper(argument3), "-");
if !(array_length_1d(dir) == 2) return -1;

// SET SCROLL PLACEMENT
ds_map_replace(tabMap, string(argument1) + "scrollPlacement", string_upper(argument3));

// SETUP SOME VARIABLES
var start = argument4;
var finish = argument5;
var pos = argument6;

// LEFT AND RIGHT
if (dir[0] == "LR") {
	ds_map_replace(tabMap, string(argument1) + "scrollLeft", start);
	ds_map_replace(tabMap, string(argument1) + "scrollRight", finish);
	if (pos <= finish && pos >= start) ds_map_replace(tabMap, string(argument1) + "scrollX", pos);
	if (pos > finish) ds_map_replace(tabMap, string(argument1) + "scrollX", finish);
	if (pos < start) ds_map_replace(tabMap, string(argument1) + "scrollX", 0);
}

// UP AND DOWN
if (dir[0] == "UD") {
	ds_map_replace(tabMap, string(argument1) + "scrollTop", start);
	ds_map_replace(tabMap, string(argument1) + "scrollBottom", finish);
	if (pos <= finish && argument6 >= start) ds_map_replace(tabMap, string(argument1) + "scrollY", pos);
	if (pos > finish) ds_map_replace(tabMap, string(argument1) + "scrollY", finish);
	if (pos < start) ds_map_replace(tabMap, string(argument1) + "scrollY", 0);
}