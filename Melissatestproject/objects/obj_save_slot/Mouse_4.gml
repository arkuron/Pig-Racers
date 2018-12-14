action_sprite_set(spr_save_slot, 2, 0);
//Save thumbnail
edgefs_save_screenshot("demo" + string(id-100000) + ".dat", true);

//Save timestamp
edgefs_save_date("demo" + string(id-100000) + ".dat", true);
edgefs_save_time("demo" + string(id-100000) + ".dat", true);
edgefs_save_timeplayed("demo" + string(id-100000) + ".dat", true);

//Save demo string
edgefs_save_var(obj_string_add.demo_str, "demo_str", "demo" + string(id-100000) + ".dat", true);

//Save demo real
edgefs_save_var(obj_real_add.demo_real, "demo_real","demo" + string(id-100000) + ".dat", true);

