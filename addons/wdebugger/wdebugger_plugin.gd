@tool
extends EditorPlugin

const AUTOLOAD_NAME = "WDebugger"

func _enable_plugin():
    # autoload the debug window
    add_autoload_singleton(AUTOLOAD_NAME, "wdebugger.tscn")
    # change embed_subwindows settings for the debug window to be separate
    ProjectSettings.set_setting("display/window/subwindows/embed_subwindows", false)
    ProjectSettings.save()

func _disable_plugin():
    # undo all
    remove_autoload_singleton(AUTOLOAD_NAME)
    ProjectSettings.set_setting("display/window/subwindows/embed_subwindows", true)
    ProjectSettings.save()
