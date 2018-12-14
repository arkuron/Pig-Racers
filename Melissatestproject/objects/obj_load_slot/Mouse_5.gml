action_sprite_set(spr_load_slot, 2, 0);
//Delete the save file
edgefs_delete("demo" + string(id-100003) + ".dat");

//Unload save file thumbnail, if any
if sprite_exists(spr_thumb) {
   sprite_delete(spr_thumb);
}

