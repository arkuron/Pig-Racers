// Process keys....
if( keyboard_check(vk_left)) && not ( keyboard_check(vk_right)){
	if( dir != DIR_LEFT) {
		dir = DIR_LEFT;
		sprite_index = sprites[dir];
		image_index=0;
		image_speed = 1.0;
		dx = -player_speed;
		if (keyboard_check(vk_up)) dy = -player_speed;
		else if (keyboard_check(vk_down)) dy = player_speed;
		else dy = 0;
	}
}
if( keyboard_check(vk_right)) && not ( keyboard_check(vk_left)){
	if( dir != DIR_RIGHT) {
		dir = DIR_RIGHT;
		sprite_index = sprites[dir];
		image_index=0;
		image_speed = 1.0;
		dx = player_speed;
		if (keyboard_check(vk_up)) dy = -player_speed;
		else if (keyboard_check(vk_down)) dy = player_speed;
		else dy = 0;
	}
}
if( keyboard_check(vk_up)) && not ( keyboard_check(vk_down)){
	if( dir != DIR_UP) {
		dir = DIR_UP;
		sprite_index = sprites[dir];
		image_index=0;
		image_speed = 1.0;
		dy = -player_speed;
		if (keyboard_check(vk_right)) dx = player_speed;
		else if (keyboard_check(vk_left)) dx = -player_speed;
	}
}
if( keyboard_check(vk_down)) && not ( keyboard_check(vk_up)){
	if( dir != DIR_DOWN) {
		dir = DIR_DOWN;
		sprite_index = sprites[dir];
		image_index=0;
		image_speed = 1.0;
		dy = player_speed;
		if (keyboard_check(vk_right)) dx = player_speed;
		else if (keyboard_check(vk_left)) dx = -player_speed;
	}
}
if not ( keyboard_check(vk_left)) && not ( keyboard_check(vk_right)){
	dx = 0;
}
if not ( keyboard_check(vk_down)) && not ( keyboard_check(vk_up)) && not ( keyboard_check(vk_left)) && not ( keyboard_check(vk_right)){
	if( dir != DIR_STOP) {
		dir = DIR_STOP;
		sprite_index = sprites[dir];
		image_index=0;
		image_speed = 1.0;
		dy = 0;
		dx = 0;		
	}
}
// process movement, will need collision detection later
x += dx
y += dy
// process player collision
// ProcessCollision(id, dx,dy, 16,16,16,2 );



