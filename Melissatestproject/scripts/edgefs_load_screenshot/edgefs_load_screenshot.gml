/// @description edgefs_load_screenshot(fname);
/// @param fname

/*
Reads a previously saved thumbnail screenshot and returns it as a sprite.

Note that the filename here is not specifically the filename of the thumbnail image itself,
but of the save file it is associated with.

Warning: this script is potentially volatile and can result in memory leaks and reduced 
performance when misused. Sprites loaded with this script should always be unloaded 
when no longer in use by running the built-in sprite_delete function.

argument0 = the desired filename of the save file, including extension (string)

Example usage: spr_thumb = edgefs_load_thumb("my_save.dat");
*/

//Separate file name from extension, if any
if string_count(".", argument0) > 0 {
   var file = string_copy(argument0, 1, string_pos(".",argument0) - 1);
} else {
   var file = argument0;
}

//Import the saved thumbnail as a sprite
if file_exists(working_directory + "\\efs_data\\" + file + "_data\\" + file + ".thumb") {
   return sprite_add(working_directory + "\\efs_data\\" + file + "_data\\" + file + ".thumb",1,false,false,0,0);
} else {
   return -1;
}
