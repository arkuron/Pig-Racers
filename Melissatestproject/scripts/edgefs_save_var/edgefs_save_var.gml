/// @description edgefs_save_var(variable, key, fname, encrypt);
/// @param variable
/// @param  key
/// @param  fname
/// @param  encrypt

/*
Writes the information contained in the given variable to a save file on the
system storage. Optionally also encrypts the data using base64 to prevent
tampering with the file outside of the game.

Supports real and string variables, arrays, data structures, and surfaces.

Note that Edge FS scripts can ALL write to the same save file.

argument0 = the variable to save (real, string, array, data structure, or surface)
argument1 = the variable name, as a string (string)
argument2 = the desired filename of the save file, including extension (string)
argument3 = enables or disables encrypting the output file (boolean) (true/false)

Note: enabling or disabling decryption in this script applies to the **entire** file,
not just the data being written here!

Example usage: edgefs_save_var(my_var, "my_var", "my_save.dat", true);
*/

//Initialize the save operation
var save_complete = false;

//Check file for encryption, if file already exists
if file_encrypted(working_directory + "\\efs_data\\" + argument2) == true {
   var decrypt = true;
} else {
   var decrypt = false;
}

//Decrypt the file, if encrypted
if decrypt == true {
   file_text_decrypt(working_directory + "\\efs_data\\" + argument2);
}

//Open or create the save file for writing
ini_open(working_directory + "\\efs_data\\" + argument2);

//If input is an array...
if is_array(argument0) and save_complete == false {
   //Initialize array index for writing
   var index_length, index_height;
   
   //Detect array type
   if array_length_2d(argument0,1) == 0 {
      var array_type = 1; //Array is 1-dimensional
   } else {
      var array_type = 2; //Array is 2-dimensional
   }
     
   //Loop through and write 1D array data
   if array_type == 1 {
      //Write variable type
      ini_write_string(argument1,"type","array_1D");
      
      //Write array data      
      for(index_length = 0; index_length < array_length_1d(argument0); index_length += 1) {
         if is_real(argument0[index_length]) {
            //Write reals
            ini_write_real(argument1,string(index_length),argument0[index_length]);
         } else {
            //Write strings
            ini_write_string(argument1,string(index_length),argument0[index_length]);
         }
      }
   }
      
   //Loop through and write 2D array data
   if array_type == 2 {
      //Write variable type
      ini_write_string(argument1,"type","array_2D");
      
      //Write array data       
      for(index_height = 0; index_height < array_height_2d(argument0); index_height += 1) {
         for(index_length = 0; index_length < array_length_2d(argument0,index_height); index_length += 1) {
            if is_real(argument0[index_height,index_length]) {
               //Write reals
               ini_write_real(argument1,string(index_height) + string(index_length),argument0[index_height,index_length]);
            } else {
               //Write strings
               ini_write_string(argument1,string(index_height) + string(index_length),argument0[index_height,index_length]);
            }
         }
      }      
   }
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a ds_grid...
else if ds_exists(argument0,ds_type_grid) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_grid");
   
   //Write ds_grid
   var ds_grid = ds_grid_write(argument0);
   ini_write_string(argument1,"var",ds_grid);
   
   //Write grid dimensions
   ini_write_real(argument1,"width",ds_grid_width(argument0));
   ini_write_real(argument1,"height",ds_grid_height(argument0));
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a ds_list...
else if ds_exists(argument0,ds_type_list) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_list");
   
   //Write ds_list
   var ds_list = ds_list_write(argument0);
   ini_write_string(argument1,"var",ds_list);
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a ds_map...
else if ds_exists(argument0,ds_type_map) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_map");
   
   //Write ds_map
   if argument3 == false {
      //Unencrypted
      var ds_map = ds_map_write(argument0);
      ini_write_string(argument1,"var",ds_map); 
   
      //End the save operation, we're done!
      save_complete = true;
   } else {
      //Encrypted with high-level encryption
      ds_map_secure_save(argument0,working_directory + "\\efs_data\\" + "temp.map");
      
      //Open the encrypted file to add into the main save file
      var ds_map_secure = file_text_open_read(working_directory + "\\efs_data\\" + "temp.map");
      
      //Read the contents of the encrypted file
      var ds_map = file_text_readln(ds_map_secure);
      
      //Close and erase the encrypted file
      file_text_close(ds_map_secure);
      file_delete(working_directory + "\\efs_data\\" + "temp.map");
      
      //Write the final encrypted ds_map to the save file
      ini_write_string(argument1,"var",ds_map);
      
      //End the save operation, we're done!
      save_complete = true;      
   }
}

//If input is a ds_priority...
else if ds_exists(argument0,ds_type_priority) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_priority");
   
   //Write ds_priority
   var ds_priority = ds_priority_write(argument0);
   ini_write_string(argument1,"var",ds_priority);
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a ds_queue...
else if ds_exists(argument0,ds_type_queue) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_queue");
   
   //Write ds_priority
   var ds_queue = ds_queue_write(argument0);
   ini_write_string(argument1,"var",ds_queue);
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a ds_stack...
else if ds_exists(argument0,ds_type_stack) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","ds_stack");
   
   //Write ds_stack
   var ds_stack = ds_stack_write(argument0);
   ini_write_string(argument1,"var",ds_stack);
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a string...
else if is_string(argument0) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","string");
      
   //Write string
   ini_write_string(argument1,"var",argument0);
   
   //End the save operation, we're done!
   save_complete = true;
}

//If input is a surface...
else if surface_exists(argument0) and save_complete == false {
   if surface_get_width(argument0) != 0 and surface_get_height(argument0) != 0 {
      //Separate file name from extension, if any
      if string_count(".", argument2) > 0 {
         var file = string_copy(argument2, 1, string_pos(".",argument2) - 1);
      } else {
         var file = argument2;
      }
   
      //Write variable type
      ini_write_string(argument1,"type","surface");
   
      //Write surface
      surface_save(argument0,working_directory + "\\efs_data\\" + file + "_data\\" + file + ".surf");   
   
      //End the save operation, we're done!
      save_complete = true;
   }
}

//If input is a real...
else if is_real(argument0) and save_complete == false {
   //Write variable type
   ini_write_string(argument1,"type","real");
      
   //Write real
   ini_write_real(argument1,"var",argument0);
   
   //End the save operation, we're done!
   save_complete = true;
}

//Close the file, we're done writing!
ini_close();

//Encrypt the file, if enabled
if argument3 == true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument2);
}
