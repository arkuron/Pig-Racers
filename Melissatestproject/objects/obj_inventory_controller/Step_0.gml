cI = scr_get_inventory_at_pos(mouse_x, mouse_y);
cT = scr_get_tab_at_pos(mouse_x, mouse_y);
cC = scr_get_cell_at_pos(mouse_x, mouse_y);
cTHooked = scr_get_tab_hooked(cI, cT);
cTSEnabled = scr_get_tab_scrollbar_enabled(cI, cT);
cVXS = scr_get_tab_visXStart(cI, cT);
cVXE = scr_get_tab_visXEnd(cI, cT);
cVYS = scr_get_tab_visYStart(cI, cT);
cVYE = scr_get_tab_visYEnd(cI, cT);
cTW = scr_get_tab_grid_width(cI, cT);
cTH = scr_get_tab_grid_height(cI, cT);
// ORGANIZE
if (keyboard_check_pressed(ord("W"))) scr_organize_tab(cI, cT);

// QUICKSTACK
if (keyboard_check_pressed(ord("Q"))) scr_quickstack_tab(cI, cT);

// DESELECT ALL CELLS
if (keyboard_check_pressed(vk_enter)) scr_deselect_all_cells(cI, cT);

// CLEAR INVENTORY
if (keyboard_check_pressed(ord("E"))) scr_clear_tab(cI, cT);

// Merge Test Inventory tab 1 to Inventory 1 tab Backpack
if (keyboard_check_pressed(vk_tab)) scr_merge_tab_to_tab(inv2, "Test Items", inv1, "Backpack", 0);


// MOVE VIEW
if (cTHooked == false) {
	if (keyboard_check_pressed(vk_left) || mouse_wheel_down()) {
		var dist = scr_get_tab_view_pixel_width(cI, cT);
		var steps = scr_get_tab_grid_width(cI, cT) - scr_get_tab_view_width(cI, cT);
		var stepDist = (dist / (steps + 1));
		if (cVXS > 0) {
			scr_set_tab_view(cI, cT, cVXS - 1, cVYS, cVXE - 1, cVYE);
			if (cTSEnabled == true) scr_set_tab_scrollbar_pos(cI, cT, (stepDist * (cVXS - 1)));
		}
	}
	if (keyboard_check_pressed(vk_right) || mouse_wheel_up()) {
		var dist = scr_get_tab_view_pixel_width(cI, cT);
		var steps = scr_get_tab_grid_width(cI, cT) - scr_get_tab_view_width(cI, cT);
		var stepDist = (dist / (steps + 1));
		if (cVXE < cTW) {
			scr_set_tab_view(cI, cT, cVXS + 1, cVYS, cVXE + 1, cVYE);
			if (cTSEnabled == true) scr_set_tab_scrollbar_pos(cI, cT, (stepDist * (cVXS + 1)));
		}
	}
	if (keyboard_check_pressed(vk_up) || mouse_wheel_up()) {
		var dist = scr_get_tab_view_pixel_height(cI, cT);
		var steps = scr_get_tab_grid_height(cI, cT) - scr_get_tab_view_height(cI, cT);
		var stepDist = (dist / (steps + 1));
		if (cVYS > 0) {
			scr_set_tab_view(cI, cT, cVXS, cVYS - 1, cVXE, cVYE - 1);
			if (cTSEnabled == true) scr_set_tab_scrollbar_pos(cI, cT, 0 + (stepDist * (cVYS - 1)));
		}
	}
	if (keyboard_check_pressed(vk_down) || mouse_wheel_down()) {
		var dist = scr_get_tab_view_pixel_height(cI, cT);
		var steps = scr_get_tab_grid_height(cI, cT) - scr_get_tab_view_height(cI, cT);
		var stepDist = (dist / (steps + 1));
		if (cVYE < cTH) {
			scr_set_tab_view(cI, cT, cVXS, cVYS + 1, cVXE, cVYE + 1);
			if (cTSEnabled == true) scr_set_tab_scrollbar_pos(cI, cT, 0 + (stepDist * (cVYS + 1)));
		}
	}
	// Select ALL Items
	if (mouse_check_button_pressed(mb_left)) {
		if (cC == -1) {
		} else {
			var cObj = scr_get_cell_object(cC);
			if (cObj == -1) {
				if !(selectedItem == -1) {
					var mS = scr_get_tab_maxStack(cI, cT);
					scr_set_cell_object(cC, selectedItem);
					if (selectedQuantity <= mS) {
						scr_set_cell_quantity(cC, selectedQuantity, 1);
						selectedItem = -1;
						selectedQuantity = -1;
					} else {
						scr_set_cell_quantity(cC, mS, 1);
						selectedQuantity -= mS;
					}
				}
			} else {
				if (selectedItem == -1) {
					selectedItem = scr_get_cell_object(cC);
					selectedQuantity = scr_get_cell_quantity(cC);
					selectType = 0;
					scr_set_cell_object(cC, -1);
					scr_set_cell_quantity(cC, 0, 1);
					prevCell = cC;
				} else if (selectedItem == scr_get_cell_object(cC)) {
					var mS = scr_get_tab_maxStack(cI, cT);
					if (selectedQuantity + scr_get_cell_quantity(cC) <= mS) {
						scr_set_cell_quantity(cC, selectedQuantity + scr_get_cell_quantity(cC), 1);
						selectedItem = -1;
						selectedQuantity = -1;
					} else {
						selectedQuantity -= (mS - scr_get_cell_quantity(cC));
						scr_set_cell_quantity(cC, mS, 1);
					}
				} else if (selectedItem != scr_get_cell_object(cC)) {
					if (scr_get_cell_object(prevCell) == -1) {
						scr_swap_cells(cC, prevCell);
						scr_set_cell_object(cC, selectedItem);
						scr_set_cell_quantity(cC, selectedQuantity, 1);
						selectedItem = -1;
						selectedQuantity = -1;
					}
				}
			}
		}
	}
	// Select Single Items
	if (mouse_check_button_pressed(mb_right)) {
		if (cC == -1) {
		} else {
			var cObj = scr_get_cell_object(cC);
			if (cObj == -1) {
			} else {
				if (selectedItem == -1) {
					selectedItem = scr_get_cell_object(cC);
					selectedQuantity = 1;
					selectType = 1;
					prevCell = cC;
					var cQ = scr_get_cell_quantity(cC);
					scr_set_cell_quantity(cC, cQ - 1, 1);
					if ((cQ - 1) <= 0) scr_set_cell_object(cC, -1);
				} else if (selectedItem == scr_get_cell_object(cC)) {
					var cQ = scr_get_cell_quantity(cC);
					if (cQ > 0) {
						selectedQuantity++;
						scr_set_cell_quantity(cC, cQ - 1, 1);
						if (cQ - 1 <= 0) scr_set_cell_object(cC, -1);
					} else {
						scr_set_cell_object(cC, -1);
					}
				}
			}
		}
	}
	
	// Hover
	if (cC = lc) {
		scr_set_cell_selected(cC, true, false);
	} else {
		scr_set_cell_selected(lc, false, false);
	}
	lc = cC;	
}

// Hook or unhook a tab
if (scr_multiclick(200000) == true) {
	if (scr_get_tab_visible(cI, cT) != -1) {
		if (hook[0] == -1 && hook[1] == -1) {
			hook[0] = cI;
			hook[1] = cT;
			hook[2] = scr_get_tab_x(cI, cT);
			hook[3] = scr_get_tab_y(cI, cT);
			scr_set_tab_hooked(cI, cT, true);
		
			// Put any items back we may have picked up
			if (selectedItem != -1) {
				scr_set_cell_object(prevCell, selectedItem);
				if (selectType == 0) scr_set_cell_quantity(prevCell, selectedQuantity, 1);
				if (selectType == 1) scr_set_cell_quantity(prevCell, selectedQuantity, 0);
				selectedItem = -1;
				selectedQuantity = -1;			
			}
		} else {
			scr_set_tab_hooked(hook[0], hook[1], false);
			hook[0] = -1;
			hook[1] = -1;	
			hook[2] = -1;
			hook[3] = -1;	
		}
	}
}

// Move Hooked Tab
if (hook[0] != -1 && hook[1] != -1) {
	scr_set_tab_position(hook[0], hook[1], mouse_x, mouse_y);
}

// Deselect / Cancel Move
if (keyboard_check_pressed(vk_escape)) {
	scr_set_tab_position(hook[0], hook[1], hook[2], hook[3]);
	hook[0] = -1;
	hook[1] = -1;
	hook[2] = -1;
	hook[3] = -1;
	if (selectedItem != -1) {
		scr_set_cell_object(prevCell, selectedItem);
		if (selectType == 0) scr_set_cell_quantity(prevCell, selectedQuantity, 1);
		if (selectType == 1) scr_set_cell_quantity(prevCell, selectedQuantity, 0);
		selectedItem = -1;
		selectedQuantity = -1;
	}
}