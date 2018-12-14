/// @description codes

//end game

if keyboard_check(vk_escape) or (keyboard_check(vk_alt) and keyboard_check(vk_f4))
    {
    game_end()
    }
    
//restart game
if (string_pos("0001",string_lower(keyboard_string)))
    {
    game_restart()
    }
    
//debug
if (string_pos("0002",string_lower(keyboard_string)))
    {
    switch (game_debug_mode)
        {
        case 0: {game_debug_mode=1}; break;
        case 1: {game_debug_mode=0}; break;
        }
    keyboard_string=""
    }

action_inherited();
