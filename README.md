# WDebugger: A Git-friendly Debugger

![screen_shot1](https://github.com/user-attachments/assets/de314a4e-4a4c-4d27-b205-e0abb9be8532)

Most (if not all) of the debugging plugins have two major flaws that I always disliked:

1. They are not git-friendly. You can't ignore the debugging functions, therefore they're committed to the git history. This causes:
    - Bloat in your git history
    - Unwanted changes to files when you just want to change a debugging function
    - Conflicts when working in a team - which is probably the most important issue
2. They take too much space on the game, which interfers with the testing; Whether be a debugging console that pops up, or just normal GUI buttons you have defined.

To Address and fix these issues, I made this plugin. It solves the first issue by separating the debugging functions in a specific file (which you can put in `.gitignore` afterwards); And solves the second problem by introducing a Window node that is separate from the main window.

Minimum Godot version needed: 4.0

If you liked the addon, please give it a star. Thanks!

## Installation

This plugin will be available in the asset store, but to install it manually you can download the project and copy the [addons folder](addons) to your project.

## How To Test

Just enable the plugin in the settings and run your game. If you're happy with the plugin, you can continue to the next section:

## How To Use

1. Define your debug functions inside `addons/wdebugger/wdebugger_core.gd` with the given instruction inside that file.
2. Open `.gitignore` file in your root directory and write the path to the core file inside of it:
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
