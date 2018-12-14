/*
//scr_collision_rectangle_custom(bbox_object,other_object,collision_distance,notme)
*/
if instance_number(argument1)>0
    {
    my_collision_rectangle_custom_object=collision_rectangle(argument0.bbox_left-argument2,argument0.bbox_top-argument2,argument0.bbox_right+argument2,argument0.bbox_bottom+argument2,argument1,1,argument3)
    
    if my_collision_rectangle_custom_object>0
        {
        return my_collision_rectangle_custom_object
        }
    else
        {
        return -1
        }
    }
else
    {
    return -1
    }