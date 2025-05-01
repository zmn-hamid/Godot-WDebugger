# WDebugger: A Git-friendly Debugger

A debugger addon that works seemslessly with Godot and uses SubWindows to to be Git friendly. Meaning you can define your functions in a specific file and put that file in .gitignore to avoid bloat in your git history.

This also makes the usage of the debugging functions way easier, making this plugin a really good choice.

If you liked the addon, please give it a star. Thanks

## Installation

This plugin will be available in the asset store, but to install it manually you can download project and copy the [addons folder](addons) folder to your project.

## How To Test

Just enable the plugin in the settings and run your game. If you're happy with the plugin, you can continue to the next secion:

## How To Use

1. Define your debug functions inside `addons/wdebugger/wdebugger_core.gd` with the given instruction inside that file.
2. Open `.gitignore` file in your main directory and write the path to the core file inside of it:
`addons/wdebugger/wdebugger_core.gd`
3. Enable the plugin and enjoy!

## How To Move The Core File

1. Cut/Copy the core file and paste it anywhere you want
2. Define this new path inside `.gitignore` and `addons/wdebugger/wdebugger.gd` -> `wdebugger_core_path` variable.

## Contribution

Even though this is a fully functional plugin, any reasonable and beneficial contribution
is highly appreciated. Feel free to make your changes and make a pull request or to just simply open an issue  
**Known features/fixes needed**:
1. Argument's default value should be placed inside the field by default.

# License

This project is licensed under the GNU General Public License (GPL) v3. See [LICENSE](LICENSE) for full terms.