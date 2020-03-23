/// @func animation_get_frame_count(animIndex)
/// @arg {int} animIndex
var animIndex = argument0;

// Sanity check
if (!animation_exists(animIndex))
{
	return 0;
}

var data = animationList[| animIndex];

return sprite_get_number(data[0]);
