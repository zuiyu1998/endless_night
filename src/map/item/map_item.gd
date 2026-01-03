extends Node2D
class_name MapItem

var x: int = 0
var y: int = 0

func on_select():
	print_debug("x: %s y: %s item select" % [x, y])
