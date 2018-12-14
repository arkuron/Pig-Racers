/// @description file_text_encrypt(fname);
/// @param fname

/*
Encrypts the input file using base64. Input file name must be enclosed in quotes.

Note that contrary to the name, file_text_encrypt can encrypt virtually any type of file,
however non-text files may become broken in the process.

argument0 = the file to encrypt (file)

Example usage: file_text_encrypt("my_file.txt");
*/

//Initialize temporary variables for encryption
var file, file_temp, file_line

//Ensure the input file exists and is unencrypted
if file_encrypted(argument0) == false {
   //Open the file to encrypt
   file = file_text_open_read(argument0);
      
   //Create a temporary file for encrypted data
   file_temp = file_text_open_write(argument0 + ".temp");
      
   //Encrypt data into temporary file
   while !file_text_eof(file) {
      //Read unencrypted line
      file_line = file_text_readln(file);
         
      //Write encrypted line
      file_text_write_string(file_temp, base64_encode(file_line));
      file_text_writeln(file_temp);
   }
      
   //Close files, we're done encrypting!
   file_text_close(file);
   file_text_close(file_temp);
      
   //Replace original file with encrypted temporary file
   file_delete(argument0);
   file_rename(argument0 + ".temp", argument0);
}
