/// @description Perform platforming!
//This is a very basic example of a platformer. You should not program your physics like this!

//if (place_free(x, y+1)) {
//   gravity = 0.2;
//} else {
//   gravity = 0;
//   vspeed = 0;
//}

/** Don't check the buttons themself here.
  * The way this engine works is by only using the direct button input here via
  * Begin step if we are local. If we are not, the other clients should overwrite
  * these variables with THEIR button input!
  **/

if (self.pressed_up) and (self.haveIattacked = 0) {
    y-=10;
	sprite_index = spr_player_up;
}
if (self.pressed_down) and (self.haveIattacked = 0) {
    y+=10;
    sprite_index = spr_player_down;
}
if (self.pressed_right) and (self.haveIattacked = 0) {
    x+=10;
    sprite_index = spr_player_right;
}
if (self.pressed_left) and (self.haveIattacked = 0) {
    x-=10;
    sprite_index = spr_player_left;
}

//if (self.pressed_up = false) and (self.pressed_up = false) and (self.pressed_up = false) and (self.pressed_up = false) {
//	image_index = 0
//	image_speed = 0
//}

self.dir = point_direction(x,y,mouse_x,mouse_y);

if (self.pressed_mb_left) and (self.haveIattacked = 0) {
	myattack = instance_create(self.x,self.y,obj_sword);
	haveIattacked = 1;
	with myattack {
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	}
	if(dir > 45 && dir <= 135){
	sprite_index = spr_player_up;
	}
	else if(dir > 135 && dir <= 225){
	sprite_index = spr_player_left;
	}
	else if(dir > 225 && dir <= 315){
	sprite_index = spr_player_down;
	}
	else if(dir > 315 || dir <= 45){
	sprite_index = spr_player_right;
	}
}

//this code resets the haveIattackedvariable
if !instance_exists(myattack) {
	self.haveIattacked = 0;
}


//if (vspeed < 0) vspeed=vspeed+gravity;

/* */
/*  */
 