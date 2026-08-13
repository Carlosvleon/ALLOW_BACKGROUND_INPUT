# Usage — Allow Background Input (English)

Overview
This document explains how to install, configure and test the Allow Background Input mod for Gen1Recomp / pokemon-love2d.

Installation
1. Copy the folder `ALLOW_BACKGROUND_INPUT` into your mods directory, for example:

   `C:\Users\<yourname>\AppData\Roaming\pokemon-love2d\mods\`

2. Alternatively, use the ZIP file `mods/ALLOW_BACKGROUND_INPUT.zip` and install it through the launcher.

Configuration
- Open the game's Options → Controls menu and find the `Allow Background Input` row.
- Choose one of: `disabled`, `keyboard`, `joystick`, `both`.
- The chosen mode is persisted to `mods/ALLOW_BACKGROUND_INPUT/config.lua`.

Testing
1. Start the game and enable `keyboard` or `both`.
2. Alt-Tab away from the game to another window.
3. Use the keys mapped to movement or actions (e.g. arrow keys, Z, X, Enter) and verify the character responds.
4. If keyboard does not work while unfocused, try `joystick` mode and test using a gamepad.

Troubleshooting
- Some platforms block keyboard state for unfocused windows; in that case prefer `joystick`.
- Check `mods/ALLOW_BACKGROUND_INPUT/config.lua` to ensure the saved mode matches your selection.
