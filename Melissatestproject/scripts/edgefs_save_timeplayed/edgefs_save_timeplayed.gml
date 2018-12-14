/// @description edgefs_save_timeplayed(fname, encrypt);
/// @param fname
/// @param  encrypt

/*
Writes a timestamp with the total time **played** to a save file on the system 
storage. Optionally also encrypts the data using base64 to prevent tampering 
with the file outside of the game.

Note that Edge FS scripts can ALL write to the same save file.

argument0 = the desired filename of the save file, including extension (string)
argument1 = enables or disables encrypting the output file (boolean) (true/false)

Note: enabling or disabling decryption in this script applies to the **entire** file,
not just the data being written here!

Example usage: edgefs_save_timeplayed("my_save.dat", true);
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

//Get previous time played, if any
var time_played = ini_read_real("timestamp","timeplayed",0);
   
//Write timestamp data
ini_write_real("timestamp","timeplayed",time_played + (global.timer - time_played));

//Close the file, we're done writing!
ini_close();

//Encrypt the file, if enabled
if argument1 == true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument0);
}
