/// @description determine transfer direction
if x=0
    {
    if room_exists(room_previous(room))
        {
        room_transfer=room_previous(room)
        }
    else
        {
        room_transfer=room_last
        }
    
    x_transfer=room_width-32
    sprite_index=spr_room_transfer_left
    }
    
if x=room_width-16
    {
    if room_exists(room_next(room))
        {
        room_transfer=room_next(room)
        }
    else
        {
        room_transfer=room_first
        }
    
    x_transfer=22
    sprite_index=spr_room_transfer_right
    }

if x>0 and x<room_width-16
    {
    room_transfer=noone
    x_transfer=noone
    sprite_index=spr_room_transfer_noone
    }

action_inherited();
