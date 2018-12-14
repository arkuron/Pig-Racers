/// @description scr_testsave(variable, key, fname, encrypt);
/// @param variable
/// @param  key
/// @param  fname
/// @param  encrypt

var save_complete = false

if file_encrypted(working_directory + "\\test\\" + argument2) == true {
   var decrypt = true;
} else {
   var decrypt = false;
}

if decrypt == true {
   file_text_decrypt(working_directory + "\\test\\" + argument2);
}

//Open or create the save file for writing
ini_open(working_directory + "\\test\\" + argument2);

if ds_exists(argument0,ds_type_list) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_list");
   
   //Write ds_list
   var ds_list = ds_list_write(argument0);
   ini_write_string(argument1,"var",ds_list);
   
   //End the save operation, we're done!
   save_complete = true;
}

ini_close();

if argument3 == true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument2);
}