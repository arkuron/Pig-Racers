if (self.apply == true)
{
	show_debug_message("Applying changes")
	var s = json_encode(skills)
	ds_map_destroy(skills);
	edgefs_save_var(s, "skills", "test.ini", false);
	show_debug_message(s)
	// edgefs_save_var(skillname, "s", "test.ini", false);
	// edgefs_save_var(skillneeds, "needs", "test.ini", false);
}