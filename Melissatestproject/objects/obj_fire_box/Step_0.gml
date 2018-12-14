/// @description fire blast creation

if instance_exists(obj_explorer)
    {
    if scr_collision_rectangle_custom(id,obj_explorer,128,1)
        {
        if shoot_counter<60
            {
            shoot_counter+=+1
            }
        else
            {
            my_fire_blast=instance_create(x,y,obj_fire_blast)
            my_fire_blast.my_solid=my_solid
        
            if scr_sprite_centre_finder(obj_explorer,"x",0)<scr_sprite_centre_finder(id,"x",0)
                {
                my_fire_blast.hspeed=-2
                }
            else
                {
                my_fire_blast.hspeed=+2
                }
                
            shoot_counter=0
            }
        }
    else
        {
        if shoot_counter>0
            {
            shoot_counter+=-1
            }
        }
    }
else
    {
    if shoot_counter>0
        {
        shoot_counter+=-1
        }
    }

///image index control

image_index=floor(shoot_counter/5)

