key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
isGrounded = place_meeting(x,y+1,obj_floor);


var move = key_right - key_left;

hsp = move * walkspd;

vsp += grv;

if (move !=0 ){
	image_xscale = move;
} 

if(isGrounded) {
	doubleJumpUsed = false;
}

if isGrounded and key_jump {
	vsp = -5;
} else if !isGrounded and key_jump and doubleJump and !doubleJumpUsed{
	vsp = -3.5;
	doubleJumpUsed = true;
}

if (!isGrounded) and keyboard_check(vk_lshift) {
	hsp += (4*move);
}

if (place_meeting(x+hsp,y,obj_floor)) {
	
	while(!place_meeting(x+sign(hsp),y,obj_floor)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

if (place_meeting(x,y+vsp,obj_floor)) {
	
	while(!place_meeting(x,y+sign(vsp),obj_floor)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

if (x == xprevious){
	image_speed = 0;
} else {
	image_speed = 0.50;
}