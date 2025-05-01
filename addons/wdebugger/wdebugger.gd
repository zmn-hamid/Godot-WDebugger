extends Node

var label_timeout: float = 3
var wdebugger_core_path: String = "res://addons/wdebugger/wdebugger_core.gd"

@onready var container_node: VBoxContainer = $Window/ScrollContainer/VBoxContainer
@onready var label_node: Label = $CanvasLayer/Label
var wdebugger_core: Variant

func _ready() -> void:
    if not OS.is_debug_build():
        queue_free()
        return
    if ResourceLoader.exists(wdebugger_core_path):
        wdebugger_core = load(wdebugger_core_path).new(self)
        for method: Dictionary in wdebugger_core.get_method_list():
            var method_name: String = method["name"]
            if method_name.begins_with("debug_"):
                create_button(method_name)

func create_button(method_name: String) -> void:
    # Create a horizontal container for the button and input fields
    var method_container: HBoxContainer = HBoxContainer.new()
    
    # Create the button
    var button: Button = Button.new()
    button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    button.text = method_name
    method_container.add_child(button)
    
    # Get method info
    var method_info: Dictionary = get_method_info(method_name)
    var args: Array = method_info.get("args", [])
    
    # Store input fields for this method
    var input_fields: Array[Control] = []
    
    # Create a vertical container for input fields
    var inputs_container: VBoxContainer = VBoxContainer.new()
    
    # Create input fields for each argument
    for arg: Dictionary in args:
        var arg_name: String = arg["name"]
        var arg_type: int = arg["type"]
        var input_field: Control = create_input_field(arg_name, arg_type)
        if input_field:
            input_fields.append(input_field)
            inputs_container.add_child(input_field)
    
    # Add inputs container to method container if there are inputs
    if not inputs_container.get_child_count() == 0:
        method_container.add_child(inputs_container)
    
    # Connect button to call method with parameters
    button.pressed.connect(func() -> void:
        var params: Array = []
        for field in input_fields:
            params.append(get_field_value(field))
        wdebugger_core.callv(method_name, params)
    )
    
    container_node.add_child(method_container)

func get_method_info(method_name: String) -> Dictionary:
    for method: Dictionary in wdebugger_core.get_method_list():
        if method["name"] == method_name:
            return method
    return {}

func create_input_field(arg_name: String, arg_type: int) -> Control:
    var container: HBoxContainer = HBoxContainer.new()
    
    # Add label for argument name
    var label: Label = Label.new()
    label.text = arg_name + ": "
    container.add_child(label)
    
    var input: Control
    
    match arg_type:
        TYPE_INT:
            input = SpinBox.new()
            input.size_flags_horizontal = Control.SIZE_EXPAND_FILL
            input.allow_greater = true
            input.allow_lesser = true
            input.step = 1
        TYPE_FLOAT:
            input = SpinBox.new()
            input.size_flags_horizontal = Control.SIZE_EXPAND_FILL
            input.allow_greater = true
            input.allow_lesser = true
            input.step = 0.01
        TYPE_STRING:
            input = LineEdit.new()
            input.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        TYPE_BOOL:
            input = CheckBox.new()
        _:
            # Unsupported type, show as string input with warning
            input = LineEdit.new()
            input.size_flags_horizontal = Control.SIZE_EXPAND_FILL
            input.placeholder_text = "Unsupported type"
    
    if input:
        input.custom_minimum_size = Vector2(100, 0)
        container.add_child(input)
    
    return container

func get_field_value(field: Control) -> Variant:
    var input: Control = field.get_child(1) # Second child is the input field
    match input.get_class():
        "SpinBox":
            return input.value
        "LineEdit":
            return input.text
        "CheckBox":
            return input.button_pressed
        _:
            return null

func log(text: String) -> void:
    label_node.text = text
    await get_tree().create_timer(label_timeout).timeout
    label_node.text = ''
