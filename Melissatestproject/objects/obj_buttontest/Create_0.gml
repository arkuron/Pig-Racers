image_speed = 0;
var skillname = ds_list_create()
var skillimage = ds_list_create()
//var skillneeds = ds_list_create()
var skillx = ds_list_create()
var skilly = ds_list_create()

skillname[| 0] =  "Skill1"
skillimage[| 0] = 1
//skillneeds[0,0] = -1  // -1 always available 
ds_list_add(skillx, lengthdir_x(70, 90))
ds_list_add(skilly, lengthdir_y(70, 90))

ds_list_add(skillname, "Skill2")
ds_list_add(skillimage, 4)
//skillneeds[1,0] = -1  // -1 always available 
ds_list_add(skillx, lengthdir_x(70, 220))
ds_list_add(skilly, lengthdir_y(70, 220))

ds_list_add(skillname, "Skill3")
ds_list_add(skillimage, 7)
//skillneeds[2,0] = -1  // -1 always available 
ds_list_add(skillx, lengthdir_x(70, 330))
ds_list_add(skilly, lengthdir_y(70, 330))

skill = ds_map_create()
ds_map_add_list(skill, "name", skillname)
ds_map_add_list(skill, "image", skillimage)
// ds_map_add_list(skill, "needs", skillneeds)
ds_map_add_list(skill, "x_pos", skillx)
ds_map_add_list(skill, "y_pos", skilly)
