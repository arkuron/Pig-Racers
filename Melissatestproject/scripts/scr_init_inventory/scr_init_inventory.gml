/// @param InventoryName
/// @param Visible

var inv = ds_map_create();
ds_map_add(inv, "tabMap", ds_map_create());
ds_map_add(inv, "invName", argument0);
ds_map_add(inv, "locked", false);
ds_map_add(inv, "visible", argument1);
ds_map_add(inv, "tabList", ds_list_create());

// Add the Inventory to the Master List
ds_list_add(obj_inventory_controller.masterInvList, inv);

// return the Map
return inv;



/*// INVENTORY STRUCTURE

Layer 0 - Master List:		Holds ALL of the inventories.
Layer 1 - Inventory Map:	Holds basic inventory information as well as the map for all the tabs
Layer 1.5 - Tab List:		Holds the Name of all the tabs
Layer 2 - Tab Map:			Holds basic tab Information as well as the Tab Grid
Layer 3 - Tab Grid:			Holds the Tab Cells
Layer 4 - Cell Map:			Holds Basic Cell information

*/// INVENTORY STRUCTURE