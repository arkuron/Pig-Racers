/// @description initial variables

instance_create(x,y,my_solid)

///detection of surrounding tessellatable objects

if tessellate=1
    {
    if instance_place(x+1,y,my_tesselation_group)>0
        {
        right_border=0
        }
    else
        {
        right_border=1
        }
        
    if instance_place(x-1,y,my_tesselation_group)>0
        {
        left_border=0
        }
    else
        {
        left_border=1
        }
        
    if instance_place(x,y+1,my_tesselation_group)>0
        {
        down_border=0
        }
    else
        {
        down_border=1
        }
        
    if instance_place(x,y-1,my_tesselation_group)>0
        {
        up_border=0
        }
    else
        {
        up_border=1
        }
    }

///image speed zeroing

image_speed=0

///depth

depth=-800

