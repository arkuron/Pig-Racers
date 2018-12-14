//scr_sprite_centre_finder(id,axis,rounded)

if argument1="x"
    {
    if argument2=0
        {
        return argument0.x+(argument0.sprite_width/2)
        }
    else
        {
        return round(argument0.x+(argument0.sprite_width/2))
        }    
    }
    


if argument1="y"
    {
    if argument2=0
        {
        return argument0.y+(argument0.sprite_height/2)
        }
    else
        {
        return round(argument0.y+(argument0.sprite_height/2))
        }
    }