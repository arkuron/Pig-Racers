/// @description power if explorer passes laser

if collision_rectangle(bbox_left+6,bbox_top+16,bbox_left+9,bbox_bottom,obj_explorer,1,1)
    {
    powered=1
    }

///sprite control

if powered=1
    {
    sprite_index=spr_laser_detector_activated
    }

action_inherited();
