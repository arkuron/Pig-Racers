/// @description action

with (obj_inventory_tracker.my_target)
    {
    explorer_clothing=0
    my_undercover_clothing=instance_create(x,y,obj_undercover_clothing)
    my_undercover_clothing.collectable=0
    }

action_inherited();
