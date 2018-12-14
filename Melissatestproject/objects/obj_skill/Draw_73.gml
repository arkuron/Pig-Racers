/// @description draw the skill

switch (status)
{
    case 0: // Unavailable
		draw_sprite(spr_skills,10,x,y) // image_index 10 is a gray image of the skill so draw this if they cant buy the skill
	break;
    case 1: // Available 
		draw_sprite(spr_skills,image_index,x,y) // they can buy the skill so draw it normally
	break;
	case 2:
		draw_sprite(spr_skills,image_index,x,y) // they have bought the skill so draw it normally but ontop draw a little box that shows they own it
		draw_sprite(spr_available,0,x,y)
	break;
}
 
 
// draw_text(x,y,skillid) for debugging you might want to draw the ID of the skill