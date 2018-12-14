/// @description edgefs_load_var(key, fname);
/// @param key
/// @param  fname

/*
Reads and returns a saved variable from a save file on the system storage,
or sets defaults if the file does not exist. Also temporarily decrypts the
data for reading, if necessary.

Supports real and string variables, arrays, data structures, and surfaces.

argument0 = the variable, as a string, to retrieve data for (string)
argument1 = the filename of the desired save file to load, including extension (string)

Example usage: my_var = edgefs_load_var("my_var", "my_save.dat");
*/

//Check file for encryption, if file already exists
if file_encrypted(working_directory + "\\efs_data\\" + argument1) = true {
   var decrypt = true;
} else {
   var decrypt = false;
}

//Decrypt the file, if encrypted
if decrypt = true {
   file_text_decrypt(working_directory + "\\efs_data\\" + argument1);
}

//Open or create the save file for reading
ini_open(working_directory + "\\efs_data\\" + argument1);

//If input is a real...
if ini_read_string(argument0,"type","real") = "real" {
   //Read real
   temp = ini_read_real(argument0,"var",0);
}

//If input is a string...
if ini_read_string(argument0,"type","real") = "string" {
   //Read string
   temp = ini_read_string(argument0,"var","0"); 
}

//If input is a 1D array...
if ini_read_string(argument0,"type","real") = "array_1D" {

   //Initialize array index for reading
   var index_length = 0;
   var index_height = 0;
      
   //Read array data
   while ini_key_exists(argument0,string(index_length)) {
      //Detect data type (real or string)
      if string_length(string_digits(ini_read_string(argument0,string(index_length),"0"))) > 0 {
         //Read reals
         temp[index_length] = ini_read_real(argument0,string(index_length),0);
      } else {
         //Read strings
         temp[index_length] = ini_read_string(argument0,string(index_length),"0");
      }

      //Read next array entry, if any
      index_length += 1;
   }
}
   
//If input is a 2D array...
if ini_read_string(argument0,"type","real") = "array_2D" {

   //Initialize array index for reading
   var index_length = 0;
   var index_height = 0;
      
   //Read array data
   while ini_key_exists(argument0,string(index_height) + string(index_length)) {
      //Detect data type (real or string)
      if string_length(string_digits(ini_read_string(argument0,string(index_height) + string(index_length),"0"))) > 0 {
         //Read reals
         temp[index_height,index_length] = ini_read_real(argument0,string(index_height) + string(index_length),0);
      } else {
         //Read strings
         temp[index_height,index_length] = ini_read_string(argument0,string(index_height) + string(index_length),"0");
      }
      
      //Read next array entry, if any
      index_length += 1;
      
      if !ini_key_exists(argument0,string(index_height) + string(index_length)) {
         index_height += 1;
         index_length = 0;
      }
   }
}

//If input is a ds_grid...
if ini_read_string(argument0,"type","real") = "ds_grid" {
   //Read ds_grid
   var ds_grid = ini_read_string(argument0,"var","");
   temp = ds_grid_create(ini_read_real(argument0,"width",1),ini_read_real(argument0,"height",1));
   ds_grid_read(temp, ds_grid);
}

//If input is a ds_list...
if ini_read_string(argument0,"type","real") = "ds_list" {
   //Read ds_list
   var ds_list = ini_read_string(argument0,"var","");
   temp = ds_list_create();
   ds_list_read(temp, ds_list);
}

//If input is a ds_map...
if ini_read_string(argument0,"type","real") = "ds_map" {
   //Read ds_map
   var ds_map = ini_read_string(argument0,"var","");
   
   //If map is encrypted...
   if decrypt = true {
      //Read the contents of the map into a temporary file...
      temp = file_text_open_write(working_directory + "\\efs_data\\" + "temp.map");
      file_text_write_string(temp, ds_map);
      file_text_close(temp);
      
      //Decrypt the file into a new map...
      temp = ds_map_secure_load(working_directory + "\\efs_data\\" + "temp.map");
      
      //...And delete the temporary file
      file_delete(working_directory + "\\efs_data\\" + "temp.map");      
   } else {
      //Otherwise read unencrypted map directly
      temp = ds_map_create();
      ds_map_read(temp, ds_map);
   }
}

//If input is a ds_priority...
if ini_read_string(argument0,"type","real") = "ds_priority" {
   //Read ds_priority
   var ds_priority = ini_read_string(argument0,"var","");
   temp = ds_priority_create();
   ds_priority_read(temp, ds_priority);
}

//If input is a ds_queue...
if ini_read_string(argument0,"type","real") = "ds_queue" {
   //Read ds_queue
   var ds_queue = ini_read_string(argument0,"var","");
   temp = ds_queue_create();
   ds_queue_read(temp, ds_queue);
}

//If input is a ds_stack...
if ini_read_string(argument0,"type","real") = "ds_stack" {
   //Read ds_stack
   var ds_stack = ini_read_string(argument0,"var","");
   temp = ds_stack_create();
   ds_stack_read(temp, ds_stack);
}

//If input is a surface...
if ini_read_string(argument0,"type","real") = "surface" {
   //Separate file name from extension, if any
   if string_count(".", argument1) > 0 {
      var file = string_copy(argument1, 1, string_pos(".",argument1) - 1);
   } else {
      var file = argument1;
   }
   
   //Read surface
   if file_exists(working_directory + "\\efs_data\\" + file + "_data\\" + file + ".surf") {
      var surface = sprite_add(working_directory + "\\efs_data\\" + file + "_data\\" + file + ".surf",1,false,false,0,0);
      temp = surface_create(sprite_get_width(surface),sprite_get_height(surface));
   
      //Redraw surface
      surface_set_target(temp);
      draw_sprite(surface,-1,0,0);
      surface_reset_target();
   
      //Unload saved surface data
      sprite_delete(surface);
   } else {
      //Return a blank surface if the saved surface does not exist
      temp = surface_create(32,32);
   }
   
}

//Close the file, we're done reading!
ini_close();

//Re-encrypt the file, if decrypted
if decrypt = true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument1);
}

//Return the imported data
return temp;
