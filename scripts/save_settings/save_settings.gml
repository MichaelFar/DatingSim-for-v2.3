function save_settings() {
	if(file_exists("Settings.txt"))
	{
		file_delete("Settings.txt");
	}
	var index = 0;
	var i = 0;
	var openFile = file_text_open_write("Settings.txt");

	var _buffer = 0;



	for(var i = 0; i < array_length_1d(global.currentSettings); i++)
	{
		file_text_write_real(openFile, global.currentSettings[i]);
		if( i < array_length_1d(global.currentSettings) - 1)
		{
			file_text_writeln(openFile);
		}
	
	}
	file_text_close(openFile);
	script_execute(save_volume);


}
