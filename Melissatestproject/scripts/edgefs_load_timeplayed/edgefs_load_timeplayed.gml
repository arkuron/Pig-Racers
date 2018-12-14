/// @description edgefs_load_timeplayed(fname, set_time);
/// @param fname
/// @param  set_time

/*
Reads and returns a timestamp with the total time **played** from a save file on the 
system storage. Optionally also sets the current session time to the loaded total
time played. Also temporarily decrypts the data for reading, if necessary.

argument0 = the filename of the desired save file to load, including extension (string)
argument1 = enables or disables setting the session time to loaded time (boolean) (true/false)

Example usage: var_timeplayed = edgefs_load_timeplayed("my_save.dat", true);
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

//Get the previous time played, if any, in microseconds
var time_played = ini_read_real("timestamp","timeplayed",0);

//Set the current session time to the loaded file's timestamp, if enabled
if argument1 == true {
   global.timer = time_played;
}

//Close the file, we're done reading!
ini_close();

//Convert time played from microseconds to hours/minutes/seconds
var seconds_played, minutes_played, hours_played;
seconds_played = string(floor(time_played/1000000) - (60*floor((time_played/1000000)/60)));
minutes_played = string(floor(floor(time_played/1000000)/60) - (60*floor((floor(time_played/1000000)/60)/60)));
hours_played = string(floor((floor(floor(time_played/1000000)/60))/60));

//Add zeros before single-digit values
if string_length(seconds_played) < 2 {
   seconds_played = "0" + seconds_played;
}
if string_length(minutes_played) < 2 {
   minutes_played = "0" + minutes_played;
}
if string_length(hours_played) < 2 {
   hours_played = "0" + hours_played;
}

//Re-encrypt the file, if decrypted
if decrypt == true {
   file_text_encrypt(working_directory + "\\efs_data\\" + argument0);
}

//Return the formatted time played string
return (hours_played + ":" + minutes_played + ":" + seconds_played);
