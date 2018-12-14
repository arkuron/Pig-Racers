/// @description inventory variable controller

inventory_cursor_item=ds_grid_get(
my_inventory_grid,
inventory_cursor_column,
inventory_cursor_row)

///item collection

//item identification
instance_deactivation_array_number=0
single_item_collected=0 //to ensure only one item collected per step
slot_selector_success_column=-4
slot_selector_success_row=-4

do
    {
    my_item=scr_collision_rectangle_custom(inventory_explorer,obj_item_parent,0,0)
    
    if my_item>0
        {
        if my_item.collectable=1 and my_item.collected=0
            {
            
            //if already item of same type with stacking space available
            for (merge_column_selector = 0; merge_column_selector < ds_grid_width(my_inventory_grid); merge_column_selector+=+1) //checking columns
                {
                if slot_selector_success_row=-4 and slot_selector_success_column=-4 //break loop step 2 if success
                    {
                    for (merge_row_selector = 0; merge_row_selector < ds_grid_height(my_inventory_grid); merge_row_selector+=+1) //checking rows
                        {
                        merge_grid_slot=ds_grid_get(my_inventory_grid,merge_column_selector,merge_row_selector)
                    
                        if merge_grid_slot!=-4
                            {
                            if merge_grid_slot.object_index=my_item.object_index
                                {                    
                                if merge_grid_slot.item_count<merge_grid_slot.item_count_maximum 
                                    {
                                    slot_selector_success_row=merge_row_selector 
                                    slot_selector_success_column=merge_column_selector 
                                    break; //assign values if success and break loop step 1
                                    }
                                }
                            }
                        }
                    }
                    else
                        {
                        break;
                        }
                }
                    
            
            
            //otherwise go into a blank space if there is one
            if slot_selector_success_row=-4 and slot_selector_success_column=-4 
                {
                for (new_column_selector = 0; new_column_selector < ds_grid_width(my_inventory_grid); new_column_selector+=+1) //checking columns
                    {
                    if slot_selector_success_row=-4 and slot_selector_success_column=-4 //break loop step 2 if success
                        {
                        for (new_row_selector = 0; new_row_selector < ds_grid_height(my_inventory_grid); new_row_selector+=+1) //checking rows
                            {
                            new_grid_slot=ds_grid_get(my_inventory_grid,new_column_selector,new_row_selector)
                            
                            if new_grid_slot=-4
                                {
                                slot_selector_success_row=new_row_selector 
                                slot_selector_success_column=new_column_selector
                                break; //assign values if success and break loop step 1
                                }
                            }
                        }
                    else
                        {
                        break;
                        }
                    }
                }
            
                
            if slot_selector_success_row!=-4 and slot_selector_success_column!=-4
                {
                selected_grid_slot=ds_grid_get(my_inventory_grid, slot_selector_success_column, slot_selector_success_row)
                        
                if selected_grid_slot=-4
                    {
                    ds_grid_set(my_inventory_grid,slot_selector_success_column,slot_selector_success_row,my_item)
                    my_item.collected=1
                    }
                else
                    {
                    selected_grid_slot.item_count+=+my_item.item_count
            
                    with (my_item)
                        {
                        instance_destroy() //if adding two identical items together destroy the new one and add them together
                        }
                    }
                    
                single_item_collected=1
                
                if item_collection_sound!=-4
                    {
                    sound_play(item_collection_sound)
                    }
                
                }
            }
            

        //deactivate current item
        instance_deactivation_array_number+=+1
        instance_deactivation_array[instance_deactivation_array_number]=my_item
        instance_deactivate_object(my_item)
        }
    }
until my_item<0 or single_item_collected=1



//reactivating deactivated items
while instance_deactivation_array_number>0
    {
    instance_activate_object(instance_deactivation_array[instance_deactivation_array_number])
    instance_deactivation_array_number+=-1
    }

///item discarding

if keyboard_check(key_input_inventory_discard)
    {
    if item_discard_rapid_counter>0
        {
        item_discard_rapid_counter+=-1
        }
    }
else
    {
    item_discard_rapid_counter=initial_item_discard_rapid_counter
    }
    
if (keyboard_check_pressed(key_input_inventory_discard) or item_discard_rapid_counter=0)
    {
    
    if inventory_cursor_item!=-4
        {
        
        if item_discarded_sound!=-4
            {
            sound_play(item_discarded_sound)
            }
        
        if inventory_cursor_item.item_count>1
            {
            inventory_cursor_item.item_count+=-1 //subtraction of item
            my_discarded_item=instance_create(inventory_explorer.x,inventory_explorer.y,inventory_cursor_item.object_index)
            my_discarded_item.collectable=0
            }
        else
            {
            inventory_cursor_item.collected=0
            inventory_cursor_item.collectable=0
            ds_grid_set(my_inventory_grid,inventory_cursor_column,inventory_cursor_row,-4)
            }
        }
    }


///item moving

if ds_grid_width(my_inventory_grid)>0 or ds_grid_height(my_inventory_grid)>0 //ensure inventory is larger than 1x1
    {
    if not keyboard_check(key_input_inventory)
    or keyboard_check(key_input_inventory_use)
    or keyboard_check(key_input_inventory_discard)
        {
        source_move_row=-4
        source_move_column=-4
        source_move_item=-4
        destination_move_row=-4
        destination_column=-4
        destination_move_item=-4
        }
        
    if keyboard_check(key_input_inventory)
        {
        if keyboard_check_pressed(key_input_inventory_move)
            {
            source_move_row=inventory_cursor_row
            source_move_column=inventory_cursor_column
            source_move_item=ds_grid_get(my_inventory_grid,source_move_column,source_move_row)
            }
            
        if keyboard_check_released(key_input_inventory_move)
            {
            destination_move_row=inventory_cursor_row
            destination_column=inventory_cursor_column
            destination_move_item=ds_grid_get(my_inventory_grid,destination_column,destination_move_row)
            
            ds_grid_set(
            my_inventory_grid,
            source_move_column,
            source_move_row,
            destination_move_item)
            
            ds_grid_set(
            my_inventory_grid,
            destination_column,
            destination_move_row,
            source_move_item)
            

            source_move_row=-4
            source_move_column=-4
            source_move_item=-4
            destination_move_row=-4
            destination_column=-4
            destination_move_item=-4
            }
        }
    }

///switching inventory slots

if keyboard_check(key_input_inventory)
    {
    if keyboard_check_pressed(key_input_inventory_up)
        {
        keyboard_string = ""
        
        if inventory_cursor_column>0
            {
            inventory_cursor_column+=-1
            }
        else
            {
            if inventory_edge_sound!=-4
                {
                sound_play(inventory_edge_sound)
                }
            }
        }
            
    if keyboard_check_pressed(key_input_inventory_left)
        {
        keyboard_string = ""
        
        if inventory_cursor_row>0
            {
            inventory_cursor_row+=-1
            }
        else
            {
            if inventory_edge_sound!=-4
                {
                sound_play(inventory_edge_sound)
                }
            }
        }
                    
        if keyboard_check_pressed(key_input_inventory_down)
        {
        keyboard_string = ""
    
        if inventory_cursor_column<ds_grid_width(my_inventory_grid)-1
            {
            inventory_cursor_column+=+1
            }
        else
            {
            if inventory_edge_sound!=-4
                {
                sound_play(inventory_edge_sound)
                }
            }
        }
            
    if keyboard_check_pressed(key_input_inventory_right)
        {
        keyboard_string = ""
        
        if inventory_cursor_row<ds_grid_height(my_inventory_grid)-1
            {
            inventory_cursor_row+=+1
            }
        else
            {
            if inventory_edge_sound!=-4
                {
                sound_play(inventory_edge_sound)
                }
            }
        }
    }

///item use criteria

//explorer range control

my_target=-4
inventory_explorer_in_range=0
            
if inventory_cursor_item!=-4
    {
    if inventory_cursor_item.inventory_explorer_in_range_required=1
        {
        collision_rectangle_distance=0
        do
            {
            target_object=scr_collision_rectangle_custom(inventory_explorer,inventory_cursor_item.item_target,collision_rectangle_distance,0)
            
            if target_object>0
                {
                my_target=target_object
                inventory_explorer_in_range=1
                }
            collision_rectangle_distance+=+1
            }
        until my_target>0 or collision_rectangle_distance>item_target_range
        }
    else
        {
        collision_rectangle_distance=0
        do
            {
            target_object=scr_collision_rectangle_custom(inventory_explorer,inventory_cursor_item.item_target,collision_rectangle_distance,0)
            
            if target_object>0
                {
                my_target=target_object
                inventory_explorer_in_range=1
                }
            collision_rectangle_distance+=+1
            }
        until my_target>0 or collision_rectangle_distance>max(room_width,room_height)
        }
    
        
    
    ///keypress controls
    if keyboard_check(key_input_inventory_use)
        {
        if item_use_keypress_rapid_counter>0
            {
            if item_use_keypress_rapid_counter=initial_item_use_keypress_rapid_counter
                {
                item_use_keypress_accepted=1
                }
            else
                {
                item_use_keypress_accepted=0
                }
                
            item_use_keypress_rapid_counter+=-1
            }
        else
            {
            item_use_keypress_accepted=1
            }
        }
    else
        {
        item_use_keypress_rapid_counter=initial_item_use_keypress_rapid_counter
        item_use_keypress_accepted=0
        }
    
    }
else
    {
    inventory_explorer_in_range=0
    item_use_keypress_accepted=0
    }


///item use

if inventory_explorer_in_range=1
and item_use_keypress_accepted=1
    {
    if inventory_cursor_item.condition_accepted=1
        {
        with (inventory_cursor_item)
            {
            event_user(1) //item use action
            
            if remove_item_after_use=1
                {
                if item_count>1
                    {
                    item_count+=-1 //subtraction of item
                    }
                else
                    {
                    ds_grid_set(other.my_inventory_grid,other.inventory_cursor_column,other.inventory_cursor_row,-4)
                    alarm[0]=60 //if item is destroyed immediately problems arise, give 2 second gap
                    }
                }
                

            if other.item_use_sound!=-4
                {
                sound_play(other.item_use_sound)
                }
            
            }
        }
    }

///cursor animation counter

if cursor_animation_counter<17
    {
    cursor_animation_counter+=+1
    }
else
    {
    cursor_animation_counter=0
    }

action_inherited();
