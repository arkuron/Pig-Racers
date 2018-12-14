action_sprite_set(spr_load_slot, 2, 0);
//Load the demo string
obj_string_add.demo_str = edgefs_load_var("demo_str", "demo" + string(id-100003) + ".dat");

//Load the demo real
obj_real_add.demo_real = edgefs_load_var("demo_real", "demo" + string(id-100003) + ".dat");

//Set the timestamp from the previous session
edgefs_load_timeplayed("demo" + string(id-100003) + ".dat", true);

