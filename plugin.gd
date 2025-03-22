@tool
extends EditorPlugin

const consts = preload("res://addons/me.bigaston.logger/consts.gd")

func _enable_plugin():
	add_autoload_singleton("GlobalLogger", "GlobalLogger.gd")
	
	if !ProjectSettings.has_setting(consts.LOG_LEVEL_NAME):
		#ProjectSettings.set_initial_value(LOG_LEVEL_NAME, DEFAULT_LOG_LEVEL)
		ProjectSettings.set_setting(consts.LOG_LEVEL_NAME, consts.DEFAULT_LOG_LEVEL)
		ProjectSettings.set_as_basic(consts.LOG_LEVEL_NAME, true)
		
	if !ProjectSettings.has_setting(consts.LOG_COLOR_NAME):
		#ProjectSettings.set_initial_value(LOG_COLOR_NAME, DEFAULT_LOG_COLOR)
		ProjectSettings.set_setting(consts.LOG_COLOR_NAME, consts.DEFAULT_LOG_COLOR)
		ProjectSettings.set_as_basic(consts.LOG_COLOR_NAME, true)
		
	ProjectSettings.save()
	
func _disable_plugin():
	remove_autoload_singleton("GlobalLogger")
	
	if ProjectSettings.has_setting(consts.LOG_LEVEL_NAME):
		ProjectSettings.set_setting(consts.LOG_LEVEL_NAME, null)
		
	if ProjectSettings.has_setting(consts.LOG_COLOR_NAME):
		ProjectSettings.set_setting(consts.LOG_COLOR_NAME, null)
		
	ProjectSettings.save()
