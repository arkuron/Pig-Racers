draw_self();
///draw compact discs

if play_music=1
    {
    draw_sprite(object_get_sprite(current_compact_disc_type),compact_disc_image_counter,x+32,y+16)
    }

action_inherited();
