/// @description KEYBOARD OR GAMEPAD CONTROLS

//When these variables are true the specified action will happen. Replace it with your way of navigating through the menus
var v_enter = (keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_face1));
var v_up = (keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu));
var v_down = (keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd));
var v_left = (keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(0,gp_padl));
var v_right = (keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(0,gp_padr));

//CHECK IF PRESSED

if (v_enter) {
    var snd_click = self.snd_click;
    with self.selected {
        audio_play_sound(snd_click,0,0);
        event_user(7);
    }
}

//CHECK IF OTHER BUTTON SELECTED

var new_name = "";

if (v_up) {
    with self.selected {new_name = b_up}
}
if (v_down) {
    with self.selected {new_name = b_down}
}
if (v_left) {
    with self.selected {new_name = b_left}
}
if (v_right) {
    with self.selected {new_name = b_right}
}


if (new_name != "") {
    //Select new button
    var new_id = noone;
    with obj_button {
        //Check if this button is the button we look for, if yes get the id
        if (name == new_name) new_id = id
    }
    if (new_id) {
        //If we have a new id, we select the new button
        audio_play_sound(snd[irandom(array_length_1d(snd)-1)],0,0)
        self.selected = new_id;
    }
}

///MOUSE CONTROLS
var newid = false;
//If you move the application surface or something you can specify an offset here
//That's also why we use global mouse events
var mousex = mouse_x;
var mousey = mouse_y;

//Check which button the mouse is in
//NOTICE: Currently the origin of the sprites has to be in the center.
with obj_button {
    if (x-sprite_xoffset < mousex && x+sprite_xoffset > mousex && 
      y-sprite_yoffset < mousey && y+sprite_yoffset > mousey) {
        newid = id;
    }
}

//If the mouse is over a new one:
//Select it!
if (newid && self.selected != newid) {
    audio_play_sound(snd[floor(irandom(array_length_1d(snd)-1))],0,0)
    self.selected = newid;
}

///Make sure all buttons have the right attributes

var selected = self.selected
with obj_button {
    //Selected
    if (selected == self.id) {
        //All even numbers will be made 1 higher
        //image_index 0 -> image_index 1
        //image_index 2 -> image_index 3
        //...
        if (image_index mod 2 == 0 or image_index == 0)
        {
            image_index += 1;
        }
        //if it is already uneven we don't have to do anything
    }
    //Not selected
    else {
        //All uneven numbers will be made 1 lower
        if (image_index mod 2 != 0)
        {
            image_index -= 1;
        }
    }
}

