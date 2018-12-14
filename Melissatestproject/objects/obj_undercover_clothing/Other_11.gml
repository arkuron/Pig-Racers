/// @description action

with (obj_inventory_tracker.my_target)
    {
    explorer_clothing=1
    my_uniform_clothing=instance_create(x,y,obj_uniform_clothing)
    my_uniform_clothing.collectable=0
    }

action_inherited();
