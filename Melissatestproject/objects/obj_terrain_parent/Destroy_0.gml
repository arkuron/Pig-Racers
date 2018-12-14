/// @description destroy solid and semi solid blocks if present

if instance_position(x,y,obj_solid_parent)
    {
    with (instance_position(x,y,obj_solid_parent))
        {
        instance_destroy()
        }
    }

