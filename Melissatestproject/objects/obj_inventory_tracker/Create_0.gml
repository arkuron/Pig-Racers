/// @description customisable variables

//explorer object
inventory_explorer=obj_explorer //this is your character
item_target_range=32 //the distance in which your character can interact with objects

//hud variables
hud_opacity=0.55 //the opacity of the HUD
square_font = font_add_sprite(spr_font_square, 32, 0, -2); draw_set_font(square_font) //this is the font
draw_set_color(c_white) //this is the color of the font
static_inventory_image=0 //choose whether the inventory images are static or animated

//target highlight variables
maximum_target_highlight_alpha=0.5 //choose how brightly highlighted target objects become
target_highlight_oscillation_speed=0.02 //choose how fast the brightness oscillates
target_highlight_color=c_aqua //the color target objects are highlighted

//keyboard controls
key_input_inventory_left=vk_left
key_input_inventory_up=vk_up
key_input_inventory_right=vk_right
key_input_inventory_down=vk_down //inventory grid controls

key_input_inventory=ord("Q") // key to bring up the inventory
key_input_inventory_discard=ord("S") //key to discard items
key_input_inventory_move=ord("A") //key to move items
key_input_inventory_use=vk_enter //key to use items

//sounds (set to -4 for no sound)

item_collection_sound=snd_item_collection //collected items sound
item_discarded_sound=snd_item_discarded //discarded items sound
item_use_sound=snd_item_use //items used sound
inventory_edge_sound=snd_inventory_edge_reached //edge of inventory grid sound

///initial variables

//inventory initialise
initial_inventory_rows=2
initial_inventory_columns=2
maximum_inventory_rows=5
maximum_inventory_columns=5

my_inventory_grid=ds_grid_create(initial_inventory_rows,initial_inventory_columns) //creates inventory grid
ds_grid_clear(my_inventory_grid,-4)

//cursor initialise
inventory_cursor_row=0
inventory_cursor_column=0
maximum_inventory_cursor_row=8
maximum_inventory_cursor_column=8

//inventory condition variables
my_target=-4
inventory_explorer_in_range=0

//move variables
source_move_row=-4
source_move_column=-4
source_move_item=-4
destination_move_row=-4
destination_column=-4
destination_move_item=-4

//cursor animation
cursor_animation_counter=0

//keypress variables
item_use_keypress_accepted=0
initial_item_use_keypress_rapid_counter=30
item_use_keypress_rapid_counter=initial_item_use_keypress_rapid_counter

initial_item_discard_rapid_counter=30
item_discard_rapid_counter=initial_item_discard_rapid_counter

action_inherited();
