/// @description text cycling

if powered=1
    {
    if text_counter_maximum!=noone
        {
        if text_timer>0
            {
            text_timer+=-1
            }
        else
            {
            if text_counter_display=text_counter_maximum
                {
                text_counter_display=1
                }
            else
                {
                text_counter_display+=+1
                }
            text_timer=text_timer_initial
            }
        }
    }

action_inherited();
