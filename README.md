# WDebugger: A Git-friendly Debugger

A debugger addon that works seemslessly with Godot and uses SubWindows to to be Git friendly. Meaning you can define your functions in a specific file and put that file in .gitignore to avoid bloat in your git history.

This also makes the usage of the debugging functions way easier, making this plugin a really good choice.

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

# License

This project is licensed under the GNU General Public License (GPL) v3. You are free to use, modify, and distribute it, but any derivative work must also be open source and released under the same license. See [LICENSE](https://www.gnu.org/licenses/gpl-3.0.en.html) for full terms.  
**Disclaimer**: If your derivative work is a game, you're free to use this plugin for its intended usage which is debugging, meaning it falls under MIT license.