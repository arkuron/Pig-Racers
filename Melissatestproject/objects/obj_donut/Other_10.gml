/// @description condition

if obj_inventory_tracker.my_target.health_point<obj_inventory_tracker.my_target.max_health_points
    {
    condition_accepted=1
    }
else
    {
    condition_accepted=0
    }

action_inherited();
