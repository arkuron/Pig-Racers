/// @param Interval

// Init some variables
var interval = argument0;
var count = array_length_1d(multiClick_timer);
var maxTime = (interval * count);
var t = get_timer();

// MULTICLICK
if (mouse_check_button_pressed(mb_left)) {
	for (i = 0; i <= count - 1; i++) {
		if (multiClick_timer[i] == -1) {
			multiClick_timer[i] = t;
			return false;
		}
		
	}
}

// Timeout
if (multiClick_timer[0] != -1) {
	if ((t - multiClick_timer[0]) > maxTime) {
		for (i = 0; i <= count - 1; i++) {
			multiClick_timer[i] = -1;
		}		
		return false;
	}
}

// Check multiclick Status
if (multiClick_timer[count - 1] != -1) {
	if ((multiClick_timer[count - 1] - multiClick_timer[0]) > maxTime) {
		for (i = 0; i <= count - 1; i++) {
			multiClick_timer[i] = -1;
		}
		return false;
	} else {
		for (i = 0; i <= count - 1; i++) {
			multiClick_timer[i] = -1;
		}
		return true;
	}
}