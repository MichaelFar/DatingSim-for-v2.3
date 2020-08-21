function save_volume() {
	if(file_exists("Volume.txt"))
	{
		file_delete("Volume.txt");
	}
	var index = 0;
	var i = 0;
	var openFile = file_text_open_write("Volume.txt");

	var _buffer = 0;

	file_text_write_real(openFile, global.musicVolume);
	file_text_writeln(openFile);

	file_text_write_real(openFile, global.voiceVolume);
	file_text_writeln(openFile);


	file_text_close(openFile);



}
