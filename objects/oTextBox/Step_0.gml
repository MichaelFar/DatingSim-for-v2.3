/// @description Insert description here
// You can write your code in this editor
    if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left))
    {
        //Text Box has been clicked
		click = !click;
    }

	if (click && script >= 0)
	{
	click = !click;
	script_execute(script);	
	}

	if (hasName) 
	{
		create_namePlate(name, x_namePlate, y_namePlate);
	}
	else
	{
		instance_destroy(oNamePlate);
	}
