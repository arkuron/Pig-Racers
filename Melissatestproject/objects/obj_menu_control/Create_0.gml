/// @description README

/*

This object does all the computing for the menu. In the create event it selects the nearest
button as the default button.

*/

/* */
///CONFIG / Search for the nearest button, that button will be selected
//Select nearest button
self.selected = obj_button.id;

//You can add new sounds to play a random sound each time something new is chosen.
self.snd[0] = snd_choose1;
//Sound that plays when a button is pressed
self.snd_click = snd_confirm;

audio_sound_gain(snd_choose1,0.4,1);

/* */
/*  */
