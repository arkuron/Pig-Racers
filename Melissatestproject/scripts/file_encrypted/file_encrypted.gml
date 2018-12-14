/// @description file_encrypted(fname);
/// @param fname

/*
Checks the given input file for encryption and returns either 'true' or 'false'
to indicate whether or not encryption was found. If the input file does not exist,
'false' will be returned by default.

argument0 = the file to check for encryption (file)

Example usage: if file_encrypted("my_file.txt") = true { ... }
*/

//Initialize temporary variables
var file, file_line;

//Ensure the input file exists
if file_exists(argument0) {
   //If the file exists, open it
   file = file_text_open_read(argument0);
   
   //Read and attempt to decrypt the first string of the file
   file_line = base64_decode(file_text_readln(file));
   
   //Close the file
   file_text_close(file);
   
   //Compare results
   if file_line != "" { //File is encrypted, return 'true'
      return true;
   }
   if file_line == "" { //File is unencrypted, return 'false'
      return false;
   }
} else {
   //Return 'false' if file does not exist
   return false;
}
