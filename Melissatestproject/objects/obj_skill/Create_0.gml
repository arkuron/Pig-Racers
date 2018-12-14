image_speed = 0 //Just to stop the skill trying to animate 

// Initialise some things we will overwrite in obj_skillspawner 
name = 0	// We don’t use this but this could be drawn next to or on mouse over to show the player the name of the skill
sid = 0		// this is the unique id of this skill 
needs = -1 // this will be an array holding the unique id of any skill requiered before getting this one
needcount = 0	// this will basically hold array_length_1d(skillneeds) so we dont have to do it every frame

linetox[0] = 0	// this will be an array of where to draw every line coming out of this skill 
linetoy[0] = 0

status = 0 // 0 = unavailable, 1 = available, purchased = 2
showing = 0