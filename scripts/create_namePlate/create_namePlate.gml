function create_namePlate() {

	var _text = argument[0];
	var _x = argument[1];
	var _y = argument[2];

	instance_destroy(oNamePlate);
	var _namePlate = instance_create_layer(_x, _y, "Text", oNamePlate);

	with (_namePlate)
	{
		text = _text;
	}

	return _namePlate;


}
