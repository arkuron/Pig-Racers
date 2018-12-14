/// @description Mouse activation of buttons

var newid = false;
//If you move the application surface or something you can specify an offset here
//That's also why we use global mouse events
var mousex = mouse_x;
var mousey = mouse_y;

//Check which button the mouse is in
with obj_button {
    if (-sprite_xoffset < mousex && x+sprite_xoffset > mousex && 
      y-sprite_yoffset < mousey && y+sprite_yoffset > mousey) {
        newid = id;
    }
}

//if it's the same as the selected button: Press it
if (newid && self.selected == newid) {
    var snd_click = self.snd_click;
    with self.selected {
        audio_play_sound(snd_click,0,0);
        event_user(7);
    }
}

