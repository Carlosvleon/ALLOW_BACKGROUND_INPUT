# Allow Background Input (mod)

This mod lets you play while the game window is inactive by polling inputs and injecting events.

Usage
- Install: copy the `ALLOW_BACKGROUND_INPUT` folder into your Love2D mods directory (for example: `C:\Users\c\AppData\Roaming\pokemon-love2d\mods`).
- In-game: press Ctrl+Alt+B to cycle modes:
  - Disabled
  - Keyboard (poll common keys)
  - Joystick (poll joystick buttons)
  - Both

Config
- The mod stores its mode in `mods/ALLOW_BACKGROUND_INPUT/config.lua`. You can edit that file to set a default mode.

Notes
- The mod pushes `keypressed`/`keyreleased` and `joystickpressed`/`joystickreleased` events when the window is unfocused. Some platforms may not allow raw keyboard state when the window is inactive; joystick axes are handled by polling.
- If you want this installed directly into your profile `mods` folder, tell me and I will copy it for you.
