/// @description Insert description here
// You can write your code in this editor
	
	if(keyboard_check_released(vk_escape))
	{
		instance_destroy();
		instance_destroy(oNamePlate);
		create_list((room_width / 2) - (450 / 2), room_height / 2 - (400 / 2), 450, 400, LIST_TYPE.PAUSE_MENU);
	}
	if (mouse_wheel_up() && global.canScrollUp)
	{
		
		y -= 30;
		global.canScrollDown = true;
		if (y < 0)
		{
			
			if(index == global.textHistoryTracker - 1)
			{
				global.canScrollUp = false;
			}
		}
		
		
	}
	else if (mouse_wheel_down() && global.canScrollDown )
	{
		y += 30;
		global.canScrollUp = true;
		if(y > room_height - sprite_height)
		{
			//y = room_height - sprite_height;
			if(index == 0)
			{
				global.canScrollDown = false;
			}
		}
	}
	if(hasName && !createdName) 
	{
		create_namePlate(name, x_namePlate, y_namePlate);
		//show_debug_message("There are " + string(global._nameCount) + " name plates");
		//global._nameCount++;
		createdName = true;
	}
	else if(!hasName)
	{
		instance_destroy(oNamePlate);
	}