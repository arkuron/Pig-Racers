show_debug_message(string(ds_exists(skill, ds_type_map)))
var s = json_encode(skill)
ds_map_destroy(skill);
edgefs_save_var(s, "skills", "test.ini", false);
show_debug_message(s)