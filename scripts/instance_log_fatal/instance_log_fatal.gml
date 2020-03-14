/// @func instance_log_trace(message)
/// @desc Log a fatal message (used in assertions)
/// @arg {string} message
var message = argument0;

instance_log_message(LogLevel.Fatal, message);