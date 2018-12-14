/// @description edgefs_save_screenshot(fname, use_temp);
/// @param fname
/// @param  use_temp

/*
Saves a screenshot to be associated with the specified save file as a thumbnail preview.
Optionally can use a temporary screenshot previously generated with edgefs_save_screenshot_temp
rather than create a new one, which makes it possible to save a screenshot from a different room 
than is running this script.

Note that the filename here is not specifically the filename of the thumbnail image itself,
but of the save file it is associated with.

argument0 = the desired filename of the save file, including extension (string)
argument1 = enables or disables using a temp screenshot instead of taking a new one (boolean) (true/false)

Example usage: edgefs_save_screenshot("my_save.dat", true);
*/

//Separate file name from extension, if any
if string_count(".", argument0) > 0 {
   var file = string_copy(argument0, 1, string_pos(".",argument0) - 1);
} else {
   var file = argument0;
}

//Permanently save temporary screenshot, if enabled
if argument1 == true {
   if file_exists(working_directory + "\\efs_data\\temp\\temp.thumb") {
      //Permanently save temporary screenshot
      file_copy(working_directory + "\\efs_data\\temp\\temp.thumb",working_directory + "\\efs_data\\" + file + "_data\\" + file + ".thumb");
      //Delete temporary copy of screenshot
      file_delete(working_directory + "\\efs_data\\temp\\temp.thumb");
   } else {
      //Create a new screenshot, if no temp screenshot is found
      screen_save(working_directory + "\\efs_data\\" + file + "_data\\" + file + ".thumb");
   }
} else {
   //Create a new screenshot, if using a temp screenshot is disabled
   screen_save(working_directory + "\\efs_data\\" + argument0 + "_data\\" + argument0 + "." + argument1 + ".thumb");
}
