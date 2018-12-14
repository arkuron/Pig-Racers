var __b__;
__b__ = action_if_variable(destroy, 0, 0);
if __b__
{
{
///horizontal movement

if keyboard_check(vk_left) and not keyboard_check(obj_inventory_tracker.key_input_inventory)
    {
    explorer_direction=180
    
    if instance_place(x+min(-1,hspeed),y,obj_solid_parent)<0
        {
        hspeed+=-1
        }
    }
    
if keyboard_check(vk_right) and not keyboard_check(obj_inventory_tracker.key_input_inventory)
    {
    explorer_direction=0
    
    if instance_place(x+max(+1,hspeed),y,obj_solid_parent)<0
        {
        hspeed+=+1
        }
    }

///vertical movement


if instance_place(x,y+1,obj_solid_parent) //resets all variables on landing
    {
    jump_timer=6
    jumping=0
    if jump_delay>0 {jump_delay+=-1}
    }

if not keyboard_check(obj_inventory_tracker.key_input_inventory)
    {
    if jumping=0 and jump_delay=0
    and keyboard_check(vk_space)
    and instance_place(x,y-1,obj_solid_parent)<0
        {
        jumping=1
        jump_delay=jump_delay_value
        }

    if jumping=1
    and jump_timer>0
    and keyboard_check(vk_space)
    and instance_place(x,y-1,obj_solid_parent)<0
        {
        jump_timer+=-1
        vspeed+=-5
        }
    }

if jumping<2
and (//if any condition is true, jumping state will stop
(vspeed<0 and instance_place(x,y+vspeed,obj_solid_parent))
or (instance_place(x,y+1,obj_solid_parent)<0 and not keyboard_check(vk_space))
or (jump_timer=0)
)
    {
    jumping=2
    }
    
if jumping<3
and vspeed>0
    {
    jumping=3 //falling state started
    }

///enemy collisions

my_enemy=collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_enemy_parent,1,1)

if my_enemy>0 and invulnerability_timer=0
    {
    //vertical bump
    if scr_sprite_centre_finder(my_enemy,"y",0)<scr_sprite_centre_finder(id,"y",0)+2
            {
            if not instance_place(x,y+16,obj_solid_parent)
                {
                vspeed=+5
                }
            }
        if scr_sprite_centre_finder(my_enemy,"y",0)>scr_sprite_centre_finder(id,"y",0)-2
            {
            if not instance_place(x,y-16,obj_solid_parent)
                {
                vspeed=-5
                }
            }
         
        
    //horizontal bump
    if scr_sprite_centre_finder(my_enemy,"x",0)<scr_sprite_centre_finder(id,"x",0)+2
        {
        if not instance_place(x+16,y,obj_solid_parent)
            {
            hspeed=+5
            }
        }
    if scr_sprite_centre_finder(my_enemy,"x",0)>scr_sprite_centre_finder(id,"x",0)-2
        {
        if not instance_place(x-16,y,obj_solid_parent)
            {
            hspeed=-5
            }
        }
    
    damage_flash=3
    movement_preventer=15
    sound_play(snd_enemy_collision)
    health_point+=-my_enemy.damage_level
    if health_point>0
        {
        invulnerability_timer=30
        }
    }

///invulnerability timer

if invulnerability_timer>0
    {
    invulnerability_timer+=-1
    }
    
if invulnerability_timer>0
    {
    if invulnerability_timer mod 6>1
        {
        invulnerability_transparency=0
        }
    else
        {
        invulnerability_transparency=1
        }
    }
else
    {
    invulnerability_transparency=0
    }
    
if health_point<=0
    {
    invulnerability_timer=0
    }

///destruction

if health_point<=0 //confirms destroyed, no further input taken
    {
    destroy=1
    }

///explorer clothing

if explorer_clothing=0
    {
    sprite_explorer_stand_left=spr_explorer_uniform_stand_left
    sprite_explorer_stand_right=spr_explorer_uniform_stand_right
    sprite_explorer_run_left=spr_explorer_uniform_run_left
    sprite_explorer_run_right=spr_explorer_uniform_run_right
    sprite_explorer_jump_left=spr_explorer_uniform_jump_left
    sprite_explorer_jump_right=spr_explorer_uniform_jump_right
    }
    
if explorer_clothing=1
    {
    sprite_explorer_stand_left=spr_explorer_undercover_stand_left
    sprite_explorer_stand_right=spr_explorer_undercover_stand_right
    sprite_explorer_run_left=spr_explorer_undercover_run_left
    sprite_explorer_run_right=spr_explorer_undercover_run_right
    sprite_explorer_jump_left=spr_explorer_undercover_jump_left
    sprite_explorer_jump_right=spr_explorer_undercover_jump_right
    }

///sprite animations

image_speed=0.5


if jumping=0 and vspeed=0
    {
    if hspeed=0
        {
        if explorer_direction=0
            {
            sprite_index=sprite_explorer_stand_right
            image_index=0
            }
            
        if explorer_direction=180
            {
            sprite_index=sprite_explorer_stand_left
            image_index=0
            }        
        }
    else
        {
        if explorer_direction=0
            {
            sprite_index=sprite_explorer_run_right
            }
            
        if explorer_direction=180
            {
            sprite_index=sprite_explorer_run_left
            }
        }
    }
else
    {
    if explorer_direction=0
        {
        sprite_index=sprite_explorer_jump_right
        image_index=0
        }
        
    if explorer_direction=180
        {
        sprite_index=sprite_explorer_jump_left
        image_index=0
        }  
    }

}
}
else
{
{
///destruction animation

if image_alpha>0
    {
    image_alpha+=-0.1
    }
else
    {
    game_restart()
    }

}
}
///room transfer

my_room_transfer=collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_room_transfer,1,1)

if my_room_transfer>0
    {    
    //room change operation
    if not (my_room_transfer.room_transfer=noone and my_room_transfer.x_transfer=noone)
        {
        room_goto(my_room_transfer.room_transfer)
        x=my_room_transfer.x_transfer
        }
    }

///solid collisions

if scr_object_collision_detector(obj_solid_parent,270)
    {move_contact_solid(270,abs(vspeed)) move_outside_solid(90,abs(vspeed)) vspeed = 0}

if scr_object_collision_detector(obj_solid_parent,90)
    {move_contact_solid(90,abs(vspeed)) move_outside_solid(270,abs(vspeed)) vspeed = 0}

if scr_object_collision_detector(obj_solid_parent,0)
    {move_contact_solid(0,abs(hspeed)) move_outside_solid(180,abs(hspeed)) hspeed = 0}

if scr_object_collision_detector(obj_solid_parent,180)
    {move_contact_solid(180,abs(hspeed)) move_outside_solid(0,abs(hspeed)) hspeed = 0}

///speed limitations

if hspeed > 4 then hspeed = 4
if hspeed < -4 then hspeed = -4
if vspeed > 6 then vspeed = 6
if vspeed < -6 then vspeed = -6

///gravity

if not instance_place(x,y+1,obj_solid_parent)
    {
    gravity=0.75
    }
else
    {
    gravity=0
    }

///rounding position variables

if x!=round(x)
    {
    x=round(x)
    }

if y!=round(y)
    {
    y=round(y)
    }

///friction

friction=0.4

