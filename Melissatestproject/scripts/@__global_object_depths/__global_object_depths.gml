// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -9999; // IDG_Controllerglobal.__objectDepths[1] = 0; // IDG_Generatorglobal.__objectDepths[2] = 0; // IDG_Floorglobal.__objectDepths[3] = 0; // IDG_Markerglobal.__objectDepths[4] = 0; // IDG_Wall

global.__objectNames[0] = "IDG_Controller";global.__objectNames[1] = "IDG_Generator";global.__objectNames[2] = "IDG_Floor";global.__objectNames[3] = "IDG_Marker";global.__objectNames[4] = "IDG_Wall";

global.__objectDepths[5] = 0; // obj_explorer
global.__objectDepths[6] = 0; // obj_item_parent
global.__objectDepths[7] = 0; // obj_coin_gold
global.__objectDepths[8] = 0; // obj_door_key_red
global.__objectDepths[9] = 0; // obj_door_key_blue
global.__objectDepths[10] = 0; // obj_donut
global.__objectDepths[11] = 0; // obj_backpack_upgrade
global.__objectDepths[12] = 0; // obj_undercover_clothing
global.__objectDepths[13] = 0; // obj_uniform_clothing
global.__objectDepths[14] = 0; // obj_compact_disc_parent
global.__objectDepths[15] = 0; // obj_compact_disc_a
global.__objectDepths[16] = 0; // obj_compact_disc_b
global.__objectDepths[17] = 0; // snd_compact_disc_c
global.__objectDepths[18] = 0; // obj_compact_disc_d
global.__objectDepths[19] = 0; // obj_terrain_parent
global.__objectDepths[20] = 0; // obj_metal_parent
global.__objectDepths[21] = 0; // obj_metal_16x16
global.__objectDepths[22] = 0; // obj_metal_32x32
global.__objectDepths[23] = 0; // obj_metal_64x64
global.__objectDepths[24] = 0; // obj_physics_parent
global.__objectDepths[25] = 0; // obj_solid_parent
global.__objectDepths[26] = 0; // obj_solid_16x16
global.__objectDepths[27] = 0; // obj_solid_32x32
global.__objectDepths[28] = 0; // obj_solid_64x64
global.__objectDepths[29] = 0; // obj_interface_parent
global.__objectDepths[30] = 0; // obj_game_tracker
global.__objectDepths[31] = 0; // obj_inventory_tracker
global.__objectDepths[32] = 0; // obj_mechanism_parent
global.__objectDepths[33] = 0; // obj_donut_shop
global.__objectDepths[34] = 0; // obj_room_transfer
global.__objectDepths[35] = 0; // obj_compact_disc_player
global.__objectDepths[36] = 0; // obj_door_parent
global.__objectDepths[37] = 0; // obj_door_red
global.__objectDepths[38] = 0; // obj_door_blue
global.__objectDepths[39] = 0; // obj_powered_parent
global.__objectDepths[40] = 0; // obj_power_input_parent
global.__objectDepths[41] = 0; // obj_power_wire
global.__objectDepths[42] = 0; // obj_laser_detector
global.__objectDepths[43] = 0; // obj_power_output_parent
global.__objectDepths[44] = 0; // obj_monitor
global.__objectDepths[45] = 0; // obj_enemy_parent
global.__objectDepths[46] = 0; // obj_buzz_saw
global.__objectDepths[47] = 0; // obj_fire_box
global.__objectDepths[48] = 0; // obj_fire_blast


global.__objectNames[5] = "obj_explorer";
global.__objectNames[6] = "obj_item_parent";
global.__objectNames[7] = "obj_coin_gold";
global.__objectNames[8] = "obj_door_key_red";
global.__objectNames[9] = "obj_door_key_blue";
global.__objectNames[10] = "obj_donut";
global.__objectNames[11] = "obj_backpack_upgrade";
global.__objectNames[12] = "obj_undercover_clothing";
global.__objectNames[13] = "obj_uniform_clothing";
global.__objectNames[14] = "obj_compact_disc_parent";
global.__objectNames[15] = "obj_compact_disc_a";
global.__objectNames[16] = "obj_compact_disc_b";
global.__objectNames[17] = "snd_compact_disc_c";
global.__objectNames[18] = "obj_compact_disc_d";
global.__objectNames[19] = "obj_terrain_parent";
global.__objectNames[20] = "obj_metal_parent";
global.__objectNames[21] = "obj_metal_16x16";
global.__objectNames[22] = "obj_metal_32x32";
global.__objectNames[23] = "obj_metal_64x64";
global.__objectNames[24] = "obj_physics_parent";
global.__objectNames[25] = "obj_solid_parent";
global.__objectNames[26] = "obj_solid_16x16";
global.__objectNames[27] = "obj_solid_32x32";
global.__objectNames[28] = "obj_solid_64x64";
global.__objectNames[29] = "obj_interface_parent";
global.__objectNames[30] = "obj_game_tracker";
global.__objectNames[31] = "obj_inventory_tracker";
global.__objectNames[32] = "obj_mechanism_parent";
global.__objectNames[33] = "obj_donut_shop";
global.__objectNames[34] = "obj_room_transfer";
global.__objectNames[35] = "obj_compact_disc_player";
global.__objectNames[36] = "obj_door_parent";
global.__objectNames[37] = "obj_door_red";
global.__objectNames[38] = "obj_door_blue";
global.__objectNames[39] = "obj_powered_parent";
global.__objectNames[40] = "obj_power_input_parent";
global.__objectNames[41] = "obj_power_wire";
global.__objectNames[42] = "obj_laser_detector";
global.__objectNames[43] = "obj_power_output_parent";
global.__objectNames[44] = "obj_monitor";
global.__objectNames[45] = "obj_enemy_parent";
global.__objectNames[46] = "obj_buzz_saw";
global.__objectNames[47] = "obj_fire_box";
global.__objectNames[48] = "obj_fire_blast";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for