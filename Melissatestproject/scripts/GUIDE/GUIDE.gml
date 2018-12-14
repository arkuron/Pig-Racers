/*

**********INTRODUCTION**********

A quick guide to using the Inventory asset.

This asset is relatively easily installed into any project.
You do not need to understand how it all works but I recommend reading through
this guide to get some understanding of what is required to use the asset.

You will have to tinker for a while to get the small parts of the asset completely
compatible with your project, such as depth etc... These things are out of my control
unfortunately so I am unable to help with them.

Everyone has their own preferences for things like inventory position on the screen,
character behaviour, etc... so I have left all of that stuff up to you, any changes
can be made easily with some minor tweaking.

The asset was designed to be highly customisable so play away with it.
You can always download a new copy. You will also be eligible for all future updates.

So far I have only tested this on a Windows 7 PC and so I am unsure of its compatibility with other platforms.




**********IMPORTANT OBJECTS**********

//obj_inventory_tracker//
The obj_inventory_tracker is the main controlling force of the asset. This
object holds many of the variables which you can customise to make the asset
behave exactly as you want to.

//obj_item parent//
This is the parent of all items which will be collectable by your character. Each item
itself can state its own initial variables otherwise the default initial variables will be used.
You should be able to add your own custom variables to items to enhance their functionality if needed.




**********TRANSFERRING TO YOUR PROJECT**********

The following is a required list of files needed for a smooth install:

//SPRITES
spr_font_square
spr_inventory_slot
spr_inventory_cursor_red
spr_inventory_cursor_blue

//SCRIPTS
scr_draw_text_outline
scr_collision_rectangle_custom
scr_object_collision_detector

//OBJECTS
obj_item_parent
obj_inventory_tracker

//SOUNDS (optional)
snd_inventory_edge_reached
snd_item_collection
snd_item_discard
snd_item_use

You should simply go to your existing project and import components from the asset
right across, that way any possible source of error will be elimated. To do this
right click in the left hand pane of Game Maker Studio and select the "Add Existing..."
option.




**********USING THE ASSET**********
Once you have all the above components imported into your project, the best course of action is
to:

-open obj_inventory_tracker, open the customisable variables section, now change the settings to suit your needs.

-create a new item, make obj_item_parent its parent.

-decide the item's initial variables, conditions and actions (default initial variables found in obj_item_parent).
It may be best to simply duplicate an existing item to begin with and simply alter its variables as practice.
Refer to your target objects as obj_inventory_tracker.my_target.
Always remember to use "Call Inherited Event" action appropriately for each event within the item.

-Remember to always assign a single inventory tracker to be created, it is persistent
so you need to remember to destroy it when your characeter meets his end.



**********FINAL NOTES**********
There is a decent amount below the surface which I recommend not trying to alter unless you know what you are doing.
Feel free to tinker but the asset is fairly complicated so always backup before you begin.

Have Fun :D




*********************
CHANGELOG
*********************
1.30
-Removed minimised version of the asset as it is unnecessary
-Removed the need to import macros into your projects
-Made inventory sounds customisable
