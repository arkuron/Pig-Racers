/// @description door ascention controls

if door_activated=1
    {
    if y>initial_y-32
        {
        vspeed=-1
        }
    else
        {
        vspeed=0
        }
    }

///keeping solid block in same place as door

my_solid.x=x
my_solid.y=y

action_inherited();
