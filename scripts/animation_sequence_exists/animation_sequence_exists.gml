/// @func animation_sequence_exists(animSequenceIndex)
/// @desc Returns true if the animation sequence exists, false if not
/// @arg {int} animSequenceIndex
var animSequenceIndex = argument0;

return animSequenceIndex >= 0 && animSequenceIndex < ds_list_size(animationSequenceList);
