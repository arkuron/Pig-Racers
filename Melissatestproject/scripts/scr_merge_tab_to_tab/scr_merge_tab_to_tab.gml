/// @param InventoryID	- FROM
/// @param TabName		- FROM
/// @param IventoryID_2	- TO
/// @param TabName_2	- TO
/// @param MergeDrop

// Merge Drop:
// 0 - Merge similar items, drop other items into tab
// 1 - Drop items into tab, dont merge similars

var inv = argument0;
var inv2 = argument2;
if ((inv == -1) || (inv2 == -1)) return -1;

// Inventory One
var tM = ds_map_find_value(inv, "tabMap");
var cG = ds_map_find_value(tM, argument1);
var gW = ds_grid_width(cG);
var gH = ds_grid_height(cG);

// Inventory Two
var tM2 = ds_map_find_value(inv2, "tabMap");
var cG2 = ds_map_find_value(tM2, argument3);
var gW2 = ds_grid_width(cG2);
var gH2 = ds_grid_height(cG2);
var maxStack = ds_map_find_value(tM2, string(argument3) + "maxStack");


// ##### MERGE #####
if (argument4 == 0) {
	scr_quickstack_tab(inv, argument1);
	scr_quickstack_tab(inv2, argument3);
	var found = false;
	for (var i = 0; i < gW; i++) {
		for (var j = 0; j < gH; j++) {
			var cell = ds_grid_get(cG, i, j);
			var cObj = ds_map_find_value(cell, "object");
			var cLocked = ds_map_find_value(cell, "locked");
			var cQ = ds_map_find_value(cell, "quantity");
			if (!(cObj == -1) && (cLocked == false)) {
				// Find the item in the other tab
				for (var k = 0; k < gW2; k++) {
					for (var l = 0; l < gH2; l++) {
						var cell2 = ds_grid_get(cG2, k, l);
						var cObj2 = ds_map_find_value(cell2, "object");
						var cLocked2 = ds_map_find_value(cell2, "locked");
						var cQ2 = ds_map_find_value(cell2, "quantity");
						if ((cObj2 == cObj) && (cLocked2 == false)) {
							if (cQ + cQ2 <= maxStack) {
								scr_set_cell_quantity(cell2, cQ, 0);
								scr_set_cell_quantity(cell, 0, 1);
								scr_set_cell_object(cell, -1); 
								found = true;
							} else {
								scr_set_cell_quantity(cell2, maxStack, 1);
								scr_set_cell_quantity(cell, cQ - (maxStack - cQ2), 1);
							}
						}
					}
				}
				// Item couldnt be found. Add the item in the first open spot. If none aviable, quit.
				if (found == false) {
					for (var k = 0; k < gW2; k++) {
						for (var l = 0; l < gH2; l++) {
							var cell2 = ds_grid_get(cG2, k, l);
							var cObj2 = ds_map_find_value(cell2, "object");
							var cLocked2 = ds_map_find_value(cell2, "locked");
							if ((cObj2 == -1) && (found == false) && (cLocked2 == false)) {
								if (cQ <= maxStack) {
									scr_set_cell_object(cell2, cObj);
									scr_set_cell_quantity(cell2, cQ, 1);
									scr_set_cell_object(cell, -1);
								} else {
									scr_set_cell_object(cell2, cObj);
									scr_set_cell_quantity(cell2, maxStack, 1);
									scr_set_cell_quantity(cell, cQ - maxStack, 1);
								}
								found = true;
							}
						}
					}
				}
			}
			found = false;
		}
	}
}
// ##### DROP #####
if (argument4 == 1) {
	var found = false;
	for (var i = 0; i < gW; i++) {
		for (var j = 0; j < gH; j++) {
			var cell = ds_grid_get(cG, i, j);
			var cObj = ds_map_find_value(cell, "object");
			var cQ = ds_map_find_value(cell, "quantity");
			if !(cObj == -1) {
				// Find an empty space in the other tab
				for (var k = 0; k < gW2; k++) {
					for (var l = 0; l < gH2; l++) {
						var cell2 = ds_grid_get(cG2, k, l);
						var cObj2 = ds_map_find_value(cell2, "object");
						if (cObj2 == -1 && found == false) {
							if (cQ <= maxStack) {
								scr_set_cell_object(cell2, cObj);
								scr_set_cell_object(cell, -1);
								scr_set_cell_quantity(cell2, cQ, 1);
								scr_set_cell_quantity(cell, 0, 1);
							} else {
								scr_set_cell_object(cell2, cObj);
								scr_set_cell_quantity(cell2, maxStack, 1);
								scr_set_cell_quantity(cell, cQ - maxStack, 1);
							}
							found = true
						}
					}
				}
			}
			found = false;
		}
	}	
}
