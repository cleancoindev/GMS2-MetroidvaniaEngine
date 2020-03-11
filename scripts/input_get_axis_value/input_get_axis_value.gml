/// @func input_map_to_axis(axisName)
/// @desc Get the value of a give axis
/// @arg {string} axisName
var axisName = argument0;
var axisValue = 0;
var entry = ds_map_find_value(o_input_system.axesMap, axisName);

if (!is_undefined(entry))
{
	// Calculate the total axis value
	for (var i = 0; i < ds_list_size(entry); i++)
	{
		var current = ds_list_find_value(o_input_system.axesMap, i);
		var inputType = current[0];
		var inputVal = current[1];
		var bPositive = current[2];
		var dir = bPositive ? 1 : -1;
		
		// Update input value based on input type
		switch (inputType)
		{
			case INPUT_KEYBOARD:
				axisValue += dir * keyboard_check(inputVal);
				break;
				
			case INPUT_GAMEPAD_BUTTON:
				if (gamepad_is_connected(0))
				{
					axisValue += dir * gamepad_button_check(0, inputVal);
				}
				
				break;
				
			case INPUT_GAMEPAD_AXIS:
				if (gamepad_is_connected(0))
				{
					axisValue += dir * gamepad_axis_value(0, inputVal);
				}
				
				break;
		}
	}
}
else
{
	log_error("INPUT: Axis " + axisName + " does not exist!");
}

return clamp(axisValue, -1, 1);
