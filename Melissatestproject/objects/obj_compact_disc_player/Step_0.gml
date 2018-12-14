/// @description mechanism action

if current_compact_disc_type>0
    {
    if play_music=0
        {
        sound_play(current_compact_disc_music)
        play_music=1
        compact_disc_image_counter=0
        }
        
    if play_music=1
        {
        
        if compact_disc_image_counter<7
            {
            compact_disc_image_counter+=+1
            }
        else
            {
            compact_disc_image_counter=0
            }
        
        if not sound_isplaying(current_compact_disc_music)
            {
            instance_create(x+32,y+16,current_compact_disc_type)
            play_music=0
            current_compact_disc_type=noone
            current_compact_disc_music=noone
            }
        }
    }

///sprite control

image_index=play_music

action_inherited();
