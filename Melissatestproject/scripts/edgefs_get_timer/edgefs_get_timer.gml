/// @description edgefs_get_timer();

/*
Increments the current session time in microseconds. MUST be run in 
the Step event of the VERY FIRST object in the ENTIRE GAME for accurate
readings. Running object MUST also be persistent!

No parameters

Example usage: edgefs_get_timer();
*/

//Increment the current session time
global.timer += delta_time;
