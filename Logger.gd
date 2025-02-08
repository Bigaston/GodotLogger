extends Node
class_name Logger

var group: String
var color: Color = Color.GRAY

func _init(_group: String, _color):
	group = _group
	
	if _color != null:
		color = _color

func _ready():
	var log_level_setting_name = preload("plugin.gd")
	
func info(message: String):
	GlobalLogger.log(message, group, GlobalLogger.LogLevel.Info, color)
	
func warn(message: String):
	GlobalLogger.log(message, group, GlobalLogger.LogLevel.Warning, color)
	
func error(message: String):
	GlobalLogger.log(message, group, GlobalLogger.LogLevel.Error, color)

func check(condition: bool, message: String):
	if !condition:
		GlobalLogger.log(message, group, GlobalLogger.LogLevel.Error, color)
