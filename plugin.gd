@tool
extends EditorPlugin

const LOG_LEVEL_NAME = "addons/logger/log_level"
const LOG_COLOR_NAME = "addons/logger/log_color"
const DEFAULT_LOG_LEVEL = 0
const DEFAULT_LOG_COLOR = {"_": Color.GRAY}

func _enable_plugin():
	add_autoload_singleton("Logger", "Logger.gd")
	
	if !ProjectSettings.has_setting(LOG_LEVEL_NAME):
		ProjectSettings.set_setting(LOG_LEVEL_NAME, DEFAULT_LOG_LEVEL)
		ProjectSettings.set_initial_value(LOG_LEVEL_NAME, DEFAULT_LOG_LEVEL)
		ProjectSettings.set_as_basic(LOG_LEVEL_NAME, true)
		
	if !ProjectSettings.has_setting(LOG_COLOR_NAME):
		ProjectSettings.set_setting(LOG_COLOR_NAME, DEFAULT_LOG_COLOR)
		ProjectSettings.set_initial_value(LOG_COLOR_NAME, DEFAULT_LOG_COLOR)
		ProjectSettings.set_as_basic(LOG_COLOR_NAME, true)
	
func _disable_plugin():
	remove_autoload_singleton("Logger")