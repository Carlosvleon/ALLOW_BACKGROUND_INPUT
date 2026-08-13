
# Allow Background Input / Permitir Entrada en Segundo Plano

English
-------
This mod lets you continue to play when the game window is inactive by polling keyboard and/or joystick inputs and pushing equivalent LÖVE input events into the engine. The option is configurable in-game via the engine options menu.

Quick install
- Copy the `ALLOW_BACKGROUND_INPUT` folder into your Love2D mods directory (example: `C:\Users\c\AppData\Roaming\pokemon-love2d\mods`).
- Or install the ZIP through the game launcher.

Usage
- Open the game's Options / Controls menu and enable `Allow Background Input` with your preferred mode: `disabled`, `keyboard`, `joystick`, or `both`.
- The mod stores its choice in `mods/ALLOW_BACKGROUND_INPUT/config.lua`.

Notes
- The mod pushes `keypressed`/`keyreleased` and `joystickpressed`/`joystickreleased` events while the window is unfocused. Some OSes may restrict raw keyboard state for inactive windows — joystick input is generally more reliable.
- If your launcher supports automatic updates from a GitHub repository, add the repository URL to `manifest.json`.

Español
-------
Este mod permite seguir jugando con la ventana del juego inactiva leyendo entradas del teclado y/o joystick y empujando eventos equivalentes al motor LÖVE. La opción es configurable desde el menú de opciones del juego.

Instalación rápida
- Copia la carpeta `ALLOW_BACKGROUND_INPUT` en tu carpeta de mods de Love2D (por ejemplo: `C:\Users\c\AppData\Roaming\pokemon-love2d\mods`).
- O instala el ZIP desde el launcher del juego.

Uso
- Abre Opciones / Controles y activa `Allow Background Input` con el modo que prefieras: `disabled`, `keyboard`, `joystick` o `both`.
- La elección se guarda en `mods/ALLOW_BACKGROUND_INPUT/config.lua`.

Notas
- El mod genera eventos `keypressed`/`keyreleased` y `joystickpressed`/`joystickreleased` cuando la ventana está sin foco. Algunos sistemas operativos pueden restringir el acceso directo al teclado cuando la ventana no está activa; el joystick suele ser más fiable.
- Si el launcher soporta actualizaciones automáticas desde GitHub, añade la URL del repositorio en `manifest.json`.

