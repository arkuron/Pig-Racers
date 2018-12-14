/// @description tessellate

if obj_game_tracker.game_debug_mode=1
    {
    draw_self() //draw normally in debug mode
    }
else
    {
    if tessellate=0
        {
        draw_self()
        }
    else
        {
        draw_sprite(sprite_index,1,x,y)
        
        if right_border=1
            {
            draw_sprite(sprite_index,2,x,y)
            }
        
        if down_border=1
            {
            draw_sprite(sprite_index,3,x,y)
            }
            
        if left_border=1
            {
            draw_sprite(sprite_index,4,x,y)
            }
                    
        if up_border=1
            {
            draw_sprite(sprite_index,5,x,y)
            }
        }
    }

