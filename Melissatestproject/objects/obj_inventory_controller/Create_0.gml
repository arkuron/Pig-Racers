randomize();
scr_multiclick_init(2);

// Create the Master List
masterInvList = ds_list_create();

// Create the Inventory
inv1 = scr_init_inventory("Inventory 1", true);
tab1 = scr_inventory_tab_init(inv1, "Backpack", 50, 50, 10, 10, 32, 5, 999, 1, true);
tab2 = scr_inventory_tab_init(inv1, "Coins", 430, 50, 1, 4, 32, 5, 10, 1, true);
tab3 = scr_inventory_tab_init(inv1, "Ammo", 478, 50, 1, 4, 32, 5, 999, 1, true);
tab4 = scr_inventory_tab_init(inv1, "Social", 910, 50, 1, 3, 32, 5, 1, 3, true);
tab5 = scr_inventory_tab_init(inv1, "Equip", 960, 50, 1, 8, 32, 5, 1, 3, true);

//Setup the Views and Scrollbars
scr_set_tab_view(inv1, "Backpack", 0, 0, 10, 5);
scr_set_tab_scrollbar(inv1, "Backpack", true, "UD-LEFT", 0, scr_get_tab_view_pixel_height(inv1, "Backpack"), 0);

// Create the Pickup inventory
inv2 = scr_init_inventory("Pickup", true);
inv2_tab1 = scr_inventory_tab_init(inv2, "Test Items", 50, 700, 10, 1, 32, 5, 99, 1, true);

// Setup Inventory 2's View and Scrollbar
scr_set_tab_view(inv2, "Test Items", 0, 0, 5, 1);
scr_set_tab_scrollbar(inv2, "Test Items", true, "LR-BOTTOM", 0, scr_get_tab_view_pixel_width(inv2, "Test Items"), 0);

// Insert items into Inventory 2's Inventory
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 0, 0), obj_test1);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 1, 0), obj_test2);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 2, 0), obj_test3);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 3, 0), obj_test4);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 4, 0), obj_test5);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 5, 0), obj_test6);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 6, 0), obj_test7);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 7, 0), obj_test8);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 8, 0), obj_test9);
scr_set_cell_object(scr_get_cell_at_grid_pos(inv2, "Test Items", 9, 0), obj_test10);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 0, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 1, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 2, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 3, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 4, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 5, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 6, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 7, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 8, 0), 99, 1);
scr_set_cell_quantity(scr_get_cell_at_grid_pos(inv2, "Test Items", 9, 0), 99, 1);

// Other Variables
cI = -1;
cT = -1;
cC = -1;
lc = -1;
cVXS = -1;
cVYS = -1;
cVXE = -1;
cVYE = -1;
cTW = -1;
cTH = -1;
drawTooltip = true;

// Hooked Tab
hook[0] = -1;	// Hooked Inventory
hook[1] = -1;	// Hooked Tab
hook[2] = -1;	// Cancle move XY
hook[3] = -1;	// Cancel move XY

//Scrollbar
cTSP = -1;
cTSPMax = -1;
cTSPMin = -1;

// Selection Variables
selectedItem = -1;
selectedQuantity = -1;
selectType = -1;
prevCell = -1;