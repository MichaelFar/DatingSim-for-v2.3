/// @description Insert description here
// You can write your code in this editor
	var nameHeight = string_height(name);
	var stringHeight = string_height(textType);
	var stringWidth = string_width(textType);
	
	if(keyboard_check_released(vk_escape))
	{
		instance_destroy();
		instance_destroy(oNamePlate);
		instance_destroy(oDarkBackground);
		create_list((room_width / 2) - (450 / 2), room_height / 2 - (400 / 2), 450, 400, LIST_TYPE.PAUSE_MENU);
	}
	if (mouse_wheel_down() && global.canScrollUp)
	{
		
		y -= 30;
		global.canScrollDown = true;
		if (y < 0)
		{
			
			if(index == global.textHistoryTracker - 1)
			{
				y = 0;
				global.canScrollUp = false;
			}
		}
		
		
	}
	else if (mouse_wheel_up() && global.canScrollDown )
	{
		y += 30;
		global.canScrollUp = true;
		if(y > room_height - stringHeight)
		{
			
			if(index == 0)
			{
				y = room_height - stringHeight;
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
