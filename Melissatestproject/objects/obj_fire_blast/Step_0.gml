/// @description sprite assignment

if fire_blast_destroy=0
    {
    if hspeed<0
        {
        image_speed=-1
        }
    else
        {
        image_speed=+1
        }
    }

///collisions

if fire_blast_destroy=0
    {
    if (scr_object_collision_detector(obj_solid_parent,270)
    and scr_object_collision_detector(obj_solid_parent,270)!=my_solid)
        {move_contact_solid(270,abs(vspeed)) move_outside_solid(90,abs(vspeed)) vspeed = 0 fire_blast_destroy=1}
    
    if (scr_object_collision_detector(obj_solid_parent,90)
    and scr_object_collision_detector(obj_solid_parent,90)!=my_solid)
        {move_contact_solid(90,abs(vspeed)) move_outside_solid(270,abs(vspeed)) vspeed = 0 fire_blast_destroy=1}
    
    if (scr_object_collision_detector(obj_solid_parent,0)
    and scr_object_collision_detector(obj_solid_parent,0)!=my_solid)
        {move_contact_solid(0,abs(hspeed)) move_outside_solid(180,abs(hspeed)) hspeed = 0 fire_blast_destroy=1}
    
    if (scr_object_collision_detector(obj_solid_parent,180)
    and scr_object_collision_detector(obj_solid_parent,180)!=my_solid)
        {move_contact_solid(180,abs(hspeed)) move_outside_solid(0,abs(hspeed)) hspeed = 0 fire_blast_destroy=1}
        
        
    if scr_collision_rectangle_custom(id,obj_explorer,0,0)
        {
        speed = 0 fire_blast_destroy=1
        }
    }

///destruction

if fire_blast_destroy=1
    {
    sprite_index=spr_fire_blast_destroy
    image_index=0
    image_speed=1
    fire_blast_destroy=2
    }
    
if fire_blast_destroy=2
    {
    if image_index=image_number-1
        {
        instance_destroy()
        }
    }

action_inherited();
