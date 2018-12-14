/// @description edgefs_delete(fname);
/// @param fname

/*
Physically erases all saved data associated with the given file from system storage

argument0 = the filename of the save file to delete, including extension (string)

Example usage: edgefs_delete("my_save.dat");
*/

//Separate file name from extension, if any
if string_count(".", argument0) > 0 {
   var file = string_copy(argument0, 1, string_pos(".",argument0) - 1);
} else {
   var file = argument0;
}

//Delete the specified save file
if file_exists(working_directory + "\\efs_data\\" + argument0) {
   file_delete(working_directory + "\\efs_data\\" + argument0);
}

//Delete associated data, if any
if directory_exists(working_directory + "\\efs_data\\" + file + "_data\\") {
   directory_destroy(working_directory + "\\efs_data\\" + file + "_data\\");
}
