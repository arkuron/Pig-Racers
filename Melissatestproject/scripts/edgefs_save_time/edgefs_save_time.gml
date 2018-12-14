/// @description edgefs_save_time(fname, encrypt);
/// @param fname
/// @param  encrypt

/*
Writes a timestamp with the local time to a save file on the system storage. 
Optionally also encrypts the data using base64 to prevent tampering with the 
file outside of the game.

Time is written in the HH:MM format by default.

Note that Edge FS scripts can ALL write to the same save file.

argument0 = the desired filename of the save file, including extension (string)
argument1 = enables or disables encrypting the output file (boolean) (true/false)

Note: enabling or disabling decryption in this script applies to the **entire** file,
not just the data being written here!

Example usage: edgefs_save_time("my_save.dat", true);
*/

//Check file for encryption, if file already exists
if file_encrypted(working_directory + "\\efs_data\\" + argument0) == true {
   var decrypt = true;
} else {
   var decrypt = false;
}

//Decrypt the file, if encrypted
if decrypt == true {
   file_text_decrypt(working_directory + "\\efs_data\\" + argument0);
}

//Open or create the save file for writing
ini_open(working_directory + "\\efs_data\\" + argument0);

//Write timestamp data
if current_minute < 10 {
   //Add zero for single-digit minutes
   ini_write_string("timestamp","time",string(current_hour) + ":0" + string(current_minute));
} else {
   //Don't add zero for double-digit minutes
   ini_write_string("timestamp","time",string(current_hour) + ":" + string(current_minute));
}

//Close the file, we're done writing!
ini_close();

//Encrypt the file, if enabled
if argument1 = true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument0);
}
