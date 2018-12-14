/// @description condition

if ds_grid_height(obj_inventory_tracker.my_inventory_grid)<obj_inventory_tracker.maximum_inventory_cursor_row
and ds_grid_width(obj_inventory_tracker.my_inventory_grid)<obj_inventory_tracker.maximum_inventory_cursor_column
    {
    condition_accepted=1
    }
else
    {
    condition_accepted=0
    }

action_inherited();
