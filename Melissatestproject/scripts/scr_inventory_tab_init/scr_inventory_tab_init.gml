/// @param InventoryID
/// @param TabName
/// @param X
/// @param Y
/// @param Width
/// @param Height
/// @param CellSize
/// @param Padding
/// @param maxStack
/// @param qDisplay
/// @param Visible

// Find the Tab
var inv = argument0;
var tabMap = ds_map_find_value(inv, "tabMap");
var tabList = ds_map_find_value(inv, "tabList");

// Add the tab name to the inventories Tab List
ds_list_add(tabList, argument1);

// Create the tab Grid
var tab = ds_grid_create(argument4, argument5);

// Add the tab to the Inventory's Tab Map
ds_map_add(tabMap, string(argument1), tab);
ds_map_add(tabMap, string(argument1) + "x", argument2);
ds_map_add(tabMap, string(argument1) + "y", argument3);
ds_map_add(tabMap, string(argument1) + "width", argument4);
ds_map_add(tabMap, string(argument1) + "height", argument5);
ds_map_add(tabMap, string(argument1) + "cellSize", argument6);
ds_map_add(tabMap, string(argument1) + "padding", argument7);
ds_map_add(tabMap, string(argument1) + "maxStack", argument8);
ds_map_add(tabMap, string(argument1) + "qDisplay", argument9);
ds_map_add(tabMap, string(argument1) + "visible", argument10);
ds_map_add(tabMap, string(argument1) + "locked", false);
ds_map_add(tabMap, string(argument1) + "visXStart", 0);
ds_map_add(tabMap, string(argument1) + "visXEnd", argument4);
ds_map_add(tabMap, string(argument1) + "visYStart", 0);
ds_map_add(tabMap, string(argument1) + "visYEnd", argument5);
ds_map_add(tabMap, string(argument1) + "inv", argument0);
ds_map_add(tabMap, string(argument1) + "cellSprite", -1);
ds_map_add(tabMap, string(argument1) + "backgroundSprite", -1);
ds_map_add(tabMap, string(argument1) + "selectedSprite", -1);
ds_map_add(tabMap, string(argument1) + "lockSprite", -1);

//HOOKING
ds_map_add(tabMap, string(argument1) + "hooked", false);

// Scroll Bar Properties
ds_map_add(tabMap, string(argument1) + "scrollEnabled", false);
ds_map_add(tabMap, string(argument1) + "scrollPlacement", 0);
ds_map_add(tabMap, string(argument1) + "scrollHooked", false);
// POSITION
ds_map_add(tabMap, string(argument1) + "scrollX", 0);
ds_map_add(tabMap, string(argument1) + "scrollY", 0);
// BOUNDS
ds_map_add(tabMap, string(argument1) + "scrollTop", 0);
ds_map_add(tabMap, string(argument1) + "scrollBottom", 0);
ds_map_add(tabMap, string(argument1) + "scrollLeft", 0);
ds_map_add(tabMap, string(argument1) + "scrollRight", 0);

// Add the Cells to the Tab Grid
for (var w = 0; w <= argument4; w++) {
	for (var h = 0; h <= argument5; h++) {
		var cell = ds_map_create();
		
		// Properties
		ds_map_add(cell, "object", -1);
		ds_map_add(cell, "quantity", 0);
		ds_map_add(cell, "locked", false);
		ds_map_add(cell, "selected", false);
		
		// General
		ds_map_add(cell, "visible", true);
		ds_map_add(cell, "x", argument2 + (w * argument6) + (w * argument7));
		ds_map_add(cell, "y", argument3 + (h * argument6) + (h * argument7));
		ds_map_add(cell, "gridX", w);
		ds_map_add(cell, "gridY", h);
		ds_map_add(cell, "inv", inv);
		ds_map_add(cell, "tabName", argument1);
		ds_grid_add(tab, w, h, cell);
	}
}