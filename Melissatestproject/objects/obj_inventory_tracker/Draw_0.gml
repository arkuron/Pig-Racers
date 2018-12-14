var __b__;
__b__ = action_if_variable(instance_number(inventory_explorer), 0, 2);
if __b__
{
{
///initiate hud opacity

if not keyboard_check(key_input_inventory)
    {
    active_hud_opacity=hud_opacity
    }
else
    {
    active_hud_opacity=1
    }
    
draw_set_alpha(active_hud_opacity)

///health bar

health_bar_x_origin=__view_get( e__VW.XView, 0 )+2
health_bar_y_origin=__view_get( e__VW.YView, 0 )+2

health_bar_x_terminus=health_bar_x_origin+(14*(obj_explorer.max_health_points-1))+15
health_bar_y_terminus=health_bar_y_origin+15

for(i = 1; i<=obj_explorer.max_health_points; i+=+1)
    {
    health_point_x_location=health_bar_x_origin+(14*(i-1))
    health_point_y_location=health_bar_y_origin

    if i<=obj_explorer.health_point
        {
        health_point_sub_image=0
        }
    else
        {
        health_point_sub_image=1
        }
    
    draw_sprite(spr_health_point,health_point_sub_image,health_point_x_location,health_point_y_location) //draw centre of health point
    
    if i=obj_explorer.max_health_points
        {
        draw_sprite(spr_health_point,2,health_point_x_location,health_point_y_location) //draw right border of health point
        }
        
    draw_sprite(spr_health_point,3,health_point_x_location,health_point_y_location) //draw bottom border of health point

    if i-1=0
        {
        draw_sprite(spr_health_point,4,health_point_x_location,health_point_y_location) //draw left border of health point
        }
        
    draw_sprite(spr_health_point,5,health_point_x_location,health_point_y_location) //draw top border of health point
    }

///inventory

//inventory grid
inventory_grid_x_origin=health_bar_x_origin
inventory_grid_y_origin=health_bar_y_origin+sprite_get_height(spr_health_point)+2

if not keyboard_check(key_input_inventory)
    {
    //selected item grid
    draw_sprite(spr_inventory_slot,0,inventory_grid_x_origin,inventory_grid_y_origin)
    draw_sprite(spr_inventory_slot,1,inventory_grid_x_origin,inventory_grid_y_origin)
    draw_sprite(spr_inventory_slot,2,inventory_grid_x_origin,inventory_grid_y_origin)
    draw_sprite(spr_inventory_slot,3,inventory_grid_x_origin,inventory_grid_y_origin)
    draw_sprite(spr_inventory_slot,4,inventory_grid_x_origin,inventory_grid_y_origin)
   
    
    if inventory_cursor_item!=-4 //to ensure an item is present
        {
        //selected item draw
        if static_inventory_image=0
            {
            draw_sprite(inventory_cursor_item.sprite_index,
            inventory_cursor_item.image_index,
            inventory_grid_x_origin+6,
            inventory_grid_y_origin+6)
            }
        else
            {
            draw_sprite(inventory_cursor_item.sprite_index,
            0,
            inventory_grid_x_origin+6,
            inventory_grid_y_origin+6)
            }
        
        //selected item number
        draw_text(
        inventory_grid_x_origin+1,
        inventory_grid_y_origin+28,
        string_hash_to_newline(string("x"+string(inventory_cursor_item.item_count))))
        

        }
    }
else
    {
    for (draw_inventory_columns=0;draw_inventory_columns<ds_grid_width(my_inventory_grid); draw_inventory_columns+=+1)
        {
        for (draw_inventory_rows=0;draw_inventory_rows<ds_grid_height(my_inventory_grid); draw_inventory_rows+=+1)
            {
            inventory_slot_location_x=inventory_grid_x_origin+(24*(draw_inventory_rows))
            inventory_slot_location_y=inventory_grid_y_origin+(24*(draw_inventory_columns))
            
            draw_sprite(spr_inventory_slot,0,inventory_slot_location_x,inventory_slot_location_y) //draw centre of inventory slot
            
            if draw_inventory_rows=ds_grid_height(my_inventory_grid)-1
                {
                draw_sprite(spr_inventory_slot,1,inventory_slot_location_x,inventory_slot_location_y) //draw right border of inventory slot
                }
            
            if draw_inventory_columns=ds_grid_width(my_inventory_grid)-1
                {
                draw_sprite(spr_inventory_slot,2,inventory_slot_location_x,inventory_slot_location_y) //draw bottom border of inventory slot
                }        
        
            if draw_inventory_rows=0
                {
                draw_sprite(spr_inventory_slot,3,inventory_slot_location_x,inventory_slot_location_y) //draw left border of inventory slot
                }
                    
            if draw_inventory_columns=0
                {
                draw_sprite(spr_inventory_slot,4,inventory_slot_location_x,inventory_slot_location_y) //draw top border of inventory slot
                }
            }
        }
    
    //inventory items
    for (draw_inventory_columns=0;draw_inventory_columns<ds_grid_width(my_inventory_grid); draw_inventory_columns+=+1)
        {
        for (draw_inventory_rows=0;draw_inventory_rows<ds_grid_height(my_inventory_grid); draw_inventory_rows+=+1)
            {
            draw_inventory_grid_item=ds_grid_get(my_inventory_grid, draw_inventory_columns, draw_inventory_rows)
            
            if draw_inventory_grid_item!=-4
                {
                item_x_origin=inventory_grid_x_origin+6+(24*(draw_inventory_rows))
                item_y_origin=inventory_grid_y_origin+6+(24*(draw_inventory_columns))
                
                if static_inventory_image=0
                    {
                    draw_sprite(draw_inventory_grid_item.sprite_index,draw_inventory_grid_item.image_index,item_x_origin,item_y_origin)
                    }
                else
                    {
                    draw_sprite(draw_inventory_grid_item.sprite_index,0,item_x_origin,item_y_origin)
                    }
                }
            }
        }
        
    if ds_grid_width(my_inventory_grid)>0 or ds_grid_height(my_inventory_grid)>0 //ensure inventory is larger than 1x1
        {
        //inventory cursor
        draw_sprite(spr_inventory_cursor_red,
        cursor_animation_counter,
        inventory_grid_x_origin+(24*inventory_cursor_row),
        inventory_grid_y_origin+(24*inventory_cursor_column))
        
    
        //inventory move cursor
        if source_move_row!=-4 and source_move_column!=-4
            {
            draw_sprite(spr_inventory_cursor_blue,
            cursor_animation_counter,
            inventory_grid_x_origin+(24*source_move_row),
            inventory_grid_y_origin+(24*source_move_column))
            }
        }
    
    //inventory text
    if inventory_cursor_item!=-4
        {
        scr_draw_text_outline(
        string("x"+string(inventory_cursor_item.item_count)+"/"+string(inventory_cursor_item.item_count_maximum)+"#"+string(inventory_cursor_item.item_name)+"#"+string(inventory_cursor_item.item_description)),
        inventory_grid_x_origin+1,
        inventory_grid_y_origin+4+(24*ds_grid_width(my_inventory_grid)),
        1,c_black,c_white)
        }
    }

///cancel hud opacity

draw_set_alpha(1)

}
}
action_inherited();
