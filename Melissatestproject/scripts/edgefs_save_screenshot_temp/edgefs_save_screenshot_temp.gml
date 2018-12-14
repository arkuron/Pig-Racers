/// @description edgefs_save_screenshot_temp();

/*
Saves a temporary screenshot to later be saved permanently alongside a save file
using edgefs_save_screenshot. Note that by default only one temporary screenshot 
can exist at a time, and saving it permanently will delete the temporary copy.

No parameters

Example usage: edgefs_save_screenshot_temp();
*/

//Save the screen to a temporary screenshot
screen_save(working_directory + "\\efs_data\\temp\\temp.thumb");
