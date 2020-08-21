function on_click_TB() {
	/*

	*/
	if (objectType == "TB") 
	{
		index += 1;
		if (index < array_length_2d(currentArray, global.currentBranch)) 
		{
			global.currentTBID = create_TB(currentArray, index, global.currentBranch, on_click_TB, flag);
		}
		else 
		{
			show_debug_message("Time for instructions ");
			instruction_parser(global.instructions);
		}
	
	}
	else if (objectType == "CH") 
	{
		instance_destroy(oChoice);
		index = 0;
	
		exclusiveHandler(flag, global.flags);
	
		if (string_pos("{", flag) != 0)
		{
			global.boolFlags[flagIndex] = true;
		}
	
		global.currentTBID = create_TB(global.branches, index + 1, currentArray, on_click_TB, flag);
	}


}
