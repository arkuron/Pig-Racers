/// @description scr_object_collision_detector(object,direction)
/// @param object
/// @param direction


if argument1=270
    {
    if vspeed>0 and instance_place(x,y+vspeed,argument0)
        {
        return instance_place(x,y+vspeed,argument0)
        }
    }
    
if argument1=90
    {
    if vspeed<0 and instance_place(x,y+vspeed,argument0)
        {
        return instance_place(x,y+vspeed,argument0)
        }
    }
    
    
if argument1=0
    {
    if hspeed>0 and instance_place(x+hspeed,y,argument0)
        {
        return instance_place(x+hspeed,y,argument0)
        }
    }
    
if argument1=180
    {
    if hspeed<0 and instance_place(x+hspeed,y,argument0)
        {
        return instance_place(x+hspeed,y,argument0)
        }
    }