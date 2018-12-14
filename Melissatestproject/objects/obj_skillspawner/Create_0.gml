/// @description data
/*
This object has all the data needed to make the skills in an array and then goes through a loop to make all the skills. 
*/

self.apply = false
skillstring = (edgefs_load_var("skills", "data.ini"))
show_debug_message(skillstring)
skills = json_decode(skillstring)
skillnames = skills[?"skillnames"]
skillimage = skills[?"imageindex"]
skillx = skills[?"skillx"]
skilly = skills[?"skilly"]
skillstatus = skills[?"status"]
skillneeds = skills[?"skillneeds"]
show_debug_message(ds_exists(skillneeds, ds_type_map))

for (i=0; i<ds_map_size(skillneeds); i++)
{
	var list = skillneeds[?string(i)];
	for (j=0; j<ds_list_size(list); j++)
	{
		show_debug_message(string(list[|j]));	
	}
}

#region // make skills


for (i=0; i<ds_list_size(skillnames); i++) // loop around for each skill
{

	var newskill = instance_create_layer(skillx[|i], skilly[|i],"instances",obj_skill); // Create an object that will be this skill 
	newskill.image_index = skillimage[|i]
	newskill.name = skillnames[|i]
	newskill.sid = i
	newskill.status = skillstatus[|i]
	var sneeds = skillneeds[?string(i)]
	newskill.needs = skillneeds[?string(i)]
	show_debug_message(string(ds_exists(newskill.needs, ds_type_list)))
	show_debug_message("We have made skill " +string(skillnames[|i]))
	
	// ASSERT – at this point the object skill has been made 
	
	with(newskill) { // we now want to pre record all the lines this skill is connected to so we dont have to work it out every time
	
		for (j=0; j<ds_list_size(sneeds); j+=1) // loop around all the skills I connect to 
		{
			needs[j] = sneeds[|j]
			show_debug_message("Skill "+ string(newskill.name) + " needs " + string(needs[j]))
			
			if (needs[j] == -1) { // This skill is always available so draw a line to the central object 
				
				status = 1
				linetox[0] = obj_skillspawner.x
				linetoy[0] = obj_skillspawner.y
				needcount = 1
				
			} else { // on the new skill record where its lines should be drawn so we don’t need to look it up every frame
				
				linetox[j] = other.skillx[|needs[j]]
				linetoy[j] = other.skilly[|needs[j]]
				  
				needcount++
			};
		}
		
	}
	
};

#endregion

#region // we are done with this object so delete it now (you could keep it if you still wanted to access the data)
//instance_destroy()
#endregion
