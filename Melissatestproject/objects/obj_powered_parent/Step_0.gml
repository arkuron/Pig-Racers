/// @description powered check
instance_deactivation_array_number=0

do
    {
    my_powered_parent=collision_rectangle(bbox_left-1,bbox_top-1,bbox_right+1,bbox_bottom+1,obj_powered_parent,1,1)
    
    if my_powered_parent>0
        {
        if my_powered_parent.powered=1
            {
            powered=1
            }
        }
        
    //deactivate current item
    instance_deactivation_array_number+=+1
    instance_deactivation_array[instance_deactivation_array_number]=my_powered_parent
    instance_deactivate_object(my_powered_parent)
    }
    until my_powered_parent<0
        


//reactivating deactivated items
while instance_deactivation_array_number>0
    {
    instance_activate_object(instance_deactivation_array[instance_deactivation_array_number])
    instance_deactivation_array_number+=-1
    }

action_inherited();
