extends Node

var debug_node: Node

func _init(p_debug_node: Node):
    debug_node = p_debug_node

### define the debug functions bellow ###
# function name must start with `debug_`
# 
# you can define function variables, like: `debug_example(amount: int)`
# you can log to main window using `debug_node.log`
# you can access the root of your project using `debug_node.root`

func debug_example() -> void:
    print_debug("WDebugger test message")
    debug_node.log("WDebugger test message")
