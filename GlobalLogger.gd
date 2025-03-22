extends Node

var log_level: int
var group_color: Dictionary = {
	"_": Color.GRAY
}

const level_color = ["gray", "white", "orange", "red"]
enum LogLevel {Log, Info, Warning, Error}

const LOG_FORMAT_STRING = "[b][color=gray][[/color][color={level_color}]{level}[/color] | [color={group_color}]{group}[/color][color=gray]][/color][/b] {message}"
const consts = preload("res://addons/me.bigaston.logger/consts.gd")

func _ready():
	log_level = ProjectSettings.get_setting(consts.LOG_LEVEL_NAME)
	group_color = ProjectSettings.get_setting(consts.LOG_COLOR_NAME)

func is_log_level(level: int):
	return level >= log_level
	
func log(message: String, group: String = "_", level: LogLevel = LogLevel.Log, color = null):
	if !is_log_level(level):
		return
		
	if color == null:
		color = group_color.get(group, Color.GRAY)
	
	print_rich(LOG_FORMAT_STRING.format({
		"group_color": "#" + color.to_html(),
		"group": group,
		"message": message,
		"level_color": level_color[level],
		"level": LogLevel.keys()[level]
	}))
	
func info(message: String, group: String = "_"):
	self.log(message, group, LogLevel.Info)
	
func warn(message: String, group: String = "_"):
	self.log(message, group, LogLevel.Warning)
	
func error(message: String, group: String = "_"):
	self.log(message, group, LogLevel.Error)
