/// @description edgefs_init_timer();

/*
Initializes the session timer for recording timestamps. Should be run
in the Create event of the VERY FIRST object in the ENTIRE GAME for
accurate readings. Running object MUST also be set to persistent!

No parameters

Example usage: edgefs_init_timer();
*/

//Initialize custom Edge FS timer
global.timer = get_timer();
