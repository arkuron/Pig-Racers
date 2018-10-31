// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // htme_obj_waitforclient
global.__objectDepths[1] = 0; // htme_obj_menu
global.__objectDepths[2] = 0; // htme_obj_wall
global.__objectDepths[3] = -5; // htme_obj_player
global.__objectDepths[4] = 500; // htme_obj_time
global.__objectDepths[5] = -200; // htme_obj_playerlist
global.__objectDepths[6] = 0; // htme_obj_door
global.__objectDepths[7] = 0; // htme_obj_network_control
global.__objectDepths[8] = -10; // htme_obj_chat
global.__objectDepths[9] = 0; // htme_obj_lanlobbydemo
global.__objectDepths[10] = -9999; // obj_htme
global.__objectDepths[11] = 0; // obj_udphphtme_lobby


global.__objectNames[0] = "htme_obj_waitforclient";
global.__objectNames[1] = "htme_obj_menu";
global.__objectNames[2] = "htme_obj_wall";
global.__objectNames[3] = "htme_obj_player";
global.__objectNames[4] = "htme_obj_time";
global.__objectNames[5] = "htme_obj_playerlist";
global.__objectNames[6] = "htme_obj_door";
global.__objectNames[7] = "htme_obj_network_control";
global.__objectNames[8] = "htme_obj_chat";
global.__objectNames[9] = "htme_obj_lanlobbydemo";
global.__objectNames[10] = "obj_htme";
global.__objectNames[11] = "obj_udphphtme_lobby";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for