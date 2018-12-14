/// @description draw item

if collected=0
or obj_game_tracker.game_debug_mode=1 //draw only if not collected or if game debug mode is 1
    {
    draw_self()
    }

///target highlighting

//highlight designation
if collected=1
and item_target!=noone
and condition_accepted=1
and obj_inventory_tracker.inventory_cursor_item=id
and obj_inventory_tracker.inventory_explorer_in_range=1
    {
    target_highlight=1
    }
else
    {
    target_highlight=0
    }

//highlight alpha oscillation
if target_highlight=1
    {
    if target_highlight_alpha_direction=+1
        {
        if target_highlight_alpha<obj_inventory_tracker.maximum_target_highlight_alpha
            {
            target_highlight_alpha+=+obj_inventory_tracker.target_highlight_oscillation_speed
            }
        else
            {
            target_highlight_alpha_direction=-1
            }
        }
        
    if target_highlight_alpha_direction=-1
        {
        if target_highlight_alpha>0
            {
            target_highlight_alpha+=-obj_inventory_tracker.target_highlight_oscillation_speed
            }
        else
            {
            target_highlight_alpha_direction=+1
            }
        }
    }
else
    {
    target_highlight_alpha_direction=+1
    target_highlight_alpha=0
    }
    
//highlighting target
if target_highlight=1
    {
    d3d_set_fog(true, obj_inventory_tracker.target_highlight_color, 0, 0);
    draw_set_alpha(target_highlight_alpha)
    draw_sprite(obj_inventory_tracker.my_target.sprite_index,obj_inventory_tracker.my_target.image_index,obj_inventory_tracker.my_target.x,obj_inventory_tracker.my_target.y)
    draw_set_alpha(1)
    d3d_set_fog(false, 0, 0, 0); 
    }

