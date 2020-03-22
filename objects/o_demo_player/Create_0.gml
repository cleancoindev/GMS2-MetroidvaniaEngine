/// @desc Initialize variables
event_inherited();

// Jumping
jumpHeight = 16;
maxJumpHeight = 64;

// Set the camera target
camera_set_target(self);

#region Input
// Move
input_add_axis("Move");
input_map_to_axis("Move", InputType.Keyboard, ord("D"), true);
input_map_to_axis("Move", InputType.Keyboard, ord("A"), false);
input_map_to_axis("Move", InputType.GamepadButton, gp_padr, true);
input_map_to_axis("Move", InputType.GamepadButton, gp_padl, false);
input_map_to_axis("Move", InputType.GamepadAxis, gp_axislh, true);

// Jump
input_add_action("Jump");
input_map_to_action("Jump", ActionType.Pressed, InputType.Keyboard, ord("W"));
input_map_to_action("Jump", ActionType.Pressed, InputType.GamepadButton, gp_face1);

// Jump Released
input_add_action("Stop Jumping");
input_map_to_action("Stop Jumping", ActionType.Released, InputType.Keyboard, ord("W"));
input_map_to_action("Stop Jumping", ActionType.Released, InputType.GamepadButton, gp_face1);

// Ducking
input_add_action("Duck");
input_map_to_action("Duck", ActionType.Pressed, InputType.Keyboard, ord("S"));
input_map_to_action("Duck", ActionType.Pressed, InputType.GamepadButton, gp_padd);
input_map_to_action("Duck", ActionType.Pressed, InputType.GamepadAxis, gp_axislv);

// Stand up
input_add_action("Stand Up");
input_map_to_action("Stand Up", ActionType.Released, InputType.Keyboard, ord("S"));
input_map_to_action("Stand Up", ActionType.Released, InputType.GamepadButton, gp_padd);
input_map_to_action("Stand Up", ActionType.Released, InputType.GamepadAxis, gp_axislv);

// Attacks
input_add_action("Light Attack");
input_map_to_action("Light Attack", ActionType.Pressed, InputType.Keyboard, vk_lcontrol);
input_map_to_action("Light Attack", ActionType.Pressed, InputType.GamepadButton, gp_face3);

input_add_action("Heavy Attack");
input_map_to_action("Heavy Attack", ActionType.Pressed, InputType.Keyboard, vk_space);
input_map_to_action("Heavy Attack", ActionType.Pressed, InputType.GamepadButton, gp_face4);

// Combo sequence
input_add_sequence("Combo1");	// Light attack, jump, light attack, light attack, heavy attack
input_sequence_add_step("Combo1", "Light Attack");
input_sequence_add_step("Combo1", "Jump");
input_sequence_add_step("Combo1", "Light Attack");
input_sequence_add_step("Combo1", "Light Attack");
input_sequence_add_step("Combo1", "Heavy Attack");
#endregion

#region States
groundedState = state_machine_add_state(noone, player_grounded_state, noone);
airborneState = state_machine_add_state(noone, player_airborne_state, noone);
duckedState = state_machine_add_state(noone, player_duck_state, noone);

state_transition_to(groundedState);
#endregion

#region Animation
idleAnim = animation_add(s_player_idle, AnimationLoopMode.Loop, 1);
runAnim = animation_add(s_player_run, AnimationLoopMode.Loop, 1);
startRunningAnim = animation_add(s_player_start_running, AnimationLoopMode.Stop, 1);
stopAnim = animation_add(s_player_stop, AnimationLoopMode.Stop, 1);
jumpAnim = animation_add(s_player_jump, AnimationLoopMode.Stop, 1);
jumpForwardAnim = animation_add(s_player_jump_forward, AnimationLoopMode.PingPong, 1);
duckAnim = animation_add(s_player_duck, AnimationLoopMode.Stop, 1);
standUpAnmi = animation_add(s_player_duck, AnimationLoopMode.Stop, -1);

movementSequence = animation_sequence_add(startRunningAnim, runAnim);

animation_sequence_play(movementSequence);
#endregion
