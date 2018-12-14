/// @description edgefs_load_date(fname);
/// @param fname

/*
Reads and returns a timestamp with the local date from a save file on the system storage. 
Also temporarily decrypts the data for reading, if necessary.

argument0 = the filename of the desired save file to load, including extension (string)

Example usage: var_date = edgefs_load_date("my_save.dat");
*/

//Check file for encryption, if file exists
if file_encrypted(working_directory + "\\efs_data\\" + argument0) == true {
   var decrypt = true;
} else {
   var decrypt = false;
}

//Decrypt the file, if encrypted
if decrypt == true {
   file_text_decrypt(working_directory + "\\efs_data\\" + argument0);
}

//Open or create the save file for reading
ini_open(working_directory + "\\efs_data\\" + argument0);

//Get the previous date, if any
var date = ini_read_string("timestamp","date","");

//Close the file, we're done reading!
ini_close();

//Re-encrypt the file, if decrypted
if decrypt == true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument0);
}

//Return the formatted date string
return date;
