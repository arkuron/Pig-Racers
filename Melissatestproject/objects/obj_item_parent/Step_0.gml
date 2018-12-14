var __b__;
__b__ = action_if_variable(collected, 0, 0);
if __b__
{
{
///collectable settings

if collectable=0
and scr_collision_rectangle_custom(self,obj_inventory_tracker.inventory_explorer,0,1)<0
    {
    collectable=1
    }

///item floating and gravity

if instance_place(x,y+1,obj_solid_parent)<0
    {
    gravity=0.125
    
    clamp(vspeed,-1,1)
    }
else
    {
    if gravity>0
        {
        gravity=0
        vspeed=0
        }
    else
        {
        if instance_place(x,y-1,obj_solid_parent)<0
            {
            vspeed=-1.25
            }
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

///persistance off

persistent=0

}
}
else
{
{
///vspeed,submerging and gravity zeroing

vspeed=0
gravity=0

///persistance on

persistent=1

///x and y assignment

x=obj_inventory_tracker.inventory_explorer.x
y=obj_inventory_tracker.inventory_explorer.y

///checking item conditions

if instance_exists(item_target)
    {
    if obj_inventory_tracker.my_target>0
        {
        if obj_inventory_tracker.my_target.object_index=item_target.object_index
            {
            event_user(0)
            }
        else
            {
            condition_accepted=0
            }
        }
    else
        {
        condition_accepted=0
        }
    }
else
    {
    condition_accepted=0
    }

}
}
