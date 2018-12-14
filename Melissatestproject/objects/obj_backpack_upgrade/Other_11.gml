/// @description action

with (obj_inventory_tracker)
    {
    ds_grid_resize(my_inventory_grid,ds_grid_height(my_inventory_grid)+1,ds_grid_width(my_inventory_grid)+1)
    
    ds_grid_set_region(
    my_inventory_grid,
    ds_grid_height(my_inventory_grid)-1,
    0,
    ds_grid_height(my_inventory_grid)-1,
    ds_grid_width(my_inventory_grid)-1,
    -4)
    
    
    ds_grid_set_region(my_inventory_grid,
    0,
    ds_grid_width(my_inventory_grid)-1,
    ds_grid_height(my_inventory_grid),
    ds_grid_width(my_inventory_grid)-1,
    -4)
    }

action_inherited();
