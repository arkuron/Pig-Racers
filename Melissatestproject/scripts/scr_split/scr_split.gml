/// @param String
/// @param Delimiter


// Init some Varialbes
var str = argument0;
var delim = argument1;
var slot = 0;
var splitArr;
var str2 = ""
var i

// Loop though and create the Array
for (i = 1; i < (string_length(str) + 1); i++) {
	var currStr = string_copy(str, i, 1);
	if (currStr == delim) {
		splitArr[slot] = str2;
		slot++;
		str2 = "";
	} else {
		str2 = str2 + currStr;
		splitArr[slot] = str2;
	}
}
return splitArr;