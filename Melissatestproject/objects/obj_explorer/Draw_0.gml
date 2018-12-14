/// @description draw sprite considerations for invulnerability transparency

if invulnerability_transparency=0
    {
    draw_self()
    }

///debug mode range displayer

if obj_game_tracker.game_debug_mode=1
    {
    draw_rectangle(
    bbox_left-obj_inventory_tracker.item_target_range,
    bbox_top-obj_inventory_tracker.item_target_range,
    bbox_right+obj_inventory_tracker.item_target_range,
    bbox_bottom+obj_inventory_tracker.item_target_range,
    1)
    }



