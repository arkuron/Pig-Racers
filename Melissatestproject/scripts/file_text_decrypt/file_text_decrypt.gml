/// @description file_text_decrypt(fname);
/// @param fname

/*
Decrypts the input file using base64. Input file name must be enclosed in quotes.

Note that contrary to the name, file_text_decrypt can decrypt virtually any type of file
encrypted with file_text_encrypt, however non-text files may become broken in the process.

argument0 = the file to decrypt (file)

Example usage: file_text_decrypt("my_file.txt");
*/

//Initialize temporary variables for decryption
var file, file_temp, file_line;

//Ensure the input file exists and is encrypted
if file_encrypted(argument0) == true {
   //Open the file to decrypt
   file = file_text_open_read(argument0);
      
   //Create a temporary file for decrypted data
   file_temp = file_text_open_write(argument0 + ".temp");
      
   //Decrypt data into temporary file
   while !file_text_eof(file) {
      //Read encrypted line
      file_line = file_text_readln(file);
         
      //Write Decrypted line
      file_text_write_string(file_temp, base64_decode(file_line));
   }
      
   //Close files, we're done decrypting!
   file_text_close(file);
   file_text_close(file_temp);
      
   //Replace original file with decrypted temporary file
   file_delete(argument0);
   file_rename(argument0 + ".temp", argument0);
}
