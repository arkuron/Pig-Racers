/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3C753C6D
/// @DnDArgument : "code" "mp_sync();$(13_10)/**$(13_10) * Tell the engine to add the position:$(13_10) * x,y$(13_10) * These variables will be synced as part of a so called "variable group".$(13_10) * It will be called "Pos" and syncs it every 5 seconds.$(13_10) * We sync the position every 5 seconds to prevent the players from desyncing.$(13_10) */$(13_10)mp_addPosition("Pos",room_speed);$(13_10)/**$(13_10)  * Change the sync mode to be SMART.$(13_10)  * This means that the packets get definitely delivered, this "emulates" the $(13_10)  * reliability of TCP.$(13_10)  * And it also only syncs if the variable has changed since the last sync.$(13_10)  * Please note that this is not that fast and should not be executed for the same group$(13_10)  * in a short time, so set a big delay!$(13_10)  */$(13_10)mp_setType("Pos",mp_type.SMART);$(13_10)/**$(13_10)  * Adds a tolerance of 20 to the Pos group (x and y position).$(13_10)  * This meand when a client recieves the position update, it will only sync it, if the$(13_10)  * local x and y position are 20 pixels more/less than the actual position.$(13_10)  * Since we sync the position to avoid desync, a low number means the player might "flicker" every$(13_10)  * time the position is recieved, because it slightly changes it.$(13_10)  * We only want to change it if the client is significantly away from the player, so it get's $(13_10)  * corrected.$(13_10)  */$(13_10)mp_tolerance("Pos",1);$(13_10)$(13_10)$(13_10)/**$(13_10) * Tell the engine to add the basic drawing variables:$(13_10) * image_alpha,image_angle,image_blend,image_index,image_speed,image_xscale$(13_10) * image_yscale,visible$(13_10) * This is mostly to sync the xscale (the direction the player faces in) and the color in this demo.$(13_10) * Also synced for the same reason as the position: To avoid desync.$(13_10) */$(13_10)mp_addBuiltinBasic("basicDrawing",room_speed);$(13_10)mp_setType("basicDrawing",mp_type.SMART);$(13_10)$(13_10)/**$(13_10) * Tell the engine to add the builtin GameMaker variables:$(13_10) * direction,gravity,gravity_direction,friction,hspeed,vspeed$(13_10) * Sync the entire physics. Also to avoid desync.$(13_10) */$(13_10)mp_addBuiltinPhysics("basicPhysics",room_speed);$(13_10)mp_setType("basicPhysics",mp_type.SMART);$(13_10)"
mp_sync();
/**
 * Tell the engine to add the position:
 * x,y
 * These variables will be synced as part of a so called "variable group".
 * It will be called "Pos" and syncs it every 5 seconds.
 * We sync the position every 5 seconds to prevent the players from desyncing.
 */
mp_addPosition("Pos",room_speed);
/**
  * Change the sync mode to be SMART.
  * This means that the packets get definitely delivered, this "emulates" the 
  * reliability of TCP.
  * And it also only syncs if the variable has changed since the last sync.
  * Please note that this is not that fast and should not be executed for the same group
  * in a short time, so set a big delay!
  */
mp_setType("Pos",mp_type.SMART);
/**
  * Adds a tolerance of 20 to the Pos group (x and y position).
  * This meand when a client recieves the position update, it will only sync it, if the
  * local x and y position are 20 pixels more/less than the actual position.
  * Since we sync the position to avoid desync, a low number means the player might "flicker" every
  * time the position is recieved, because it slightly changes it.
  * We only want to change it if the client is significantly away from the player, so it get's 
  * corrected.
  */
mp_tolerance("Pos",1);


/**
 * Tell the engine to add the basic drawing variables:
 * image_alpha,image_angle,image_blend,image_index,image_speed,image_xscale
 * image_yscale,visible
 * This is mostly to sync the xscale (the direction the player faces in) and the color in this demo.
 * Also synced for the same reason as the position: To avoid desync.
 */
mp_addBuiltinBasic("basicDrawing",room_speed);
mp_setType("basicDrawing",mp_type.SMART);

/**
 * Tell the engine to add the builtin GameMaker variables:
 * direction,gravity,gravity_direction,friction,hspeed,vspeed
 * Sync the entire physics. Also to avoid desync.
 */
mp_addBuiltinPhysics("basicPhysics",room_speed);
mp_setType("basicPhysics",mp_type.SMART);
/**/

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 136B8AF3
/// @DnDArgument : "steps" "10"
alarm_set(0, 10);