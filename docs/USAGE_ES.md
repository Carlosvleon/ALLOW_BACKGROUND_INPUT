# Uso — Allow Background Input (Español)

Resumen
Este documento explica cómo instalar, configurar y probar el mod Allow Background Input para Gen1Recomp / pokemon-love2d.

Instalación
1. Copia la carpeta `ALLOW_BACKGROUND_INPUT` en tu directorio de mods, por ejemplo:

   `C:\Users\<tu_usuario>\AppData\Roaming\pokemon-love2d\mods\`

2. O usa el ZIP `mods/ALLOW_BACKGROUND_INPUT.zip` y añádelo desde el launcher.

Configuración
- Abre Opciones → Controles en el juego y localiza la fila `Allow Background Input`.
- Elige: `disabled`, `keyboard`, `joystick` o `both`.
- La opción se guarda en `mods/ALLOW_BACKGROUND_INPUT/config.lua`.

Pruebas
1. Inicia el juego y selecciona `keyboard` o `both`.
2. Sal de la ventana del juego (Alt-Tab) a otra aplicación.
3. Usa las teclas de movimiento o acción (flechas, Z, X, Enter) y verifica que el personaje responde.
4. Si el teclado no funciona con la ventana sin foco, prueba el modo `joystick` con un gamepad.

Resolución de problemas
- Algunos sistemas operativos bloquean el estado del teclado para ventanas sin foco; en ese caso usa `joystick`.
- Revisa `mods/ALLOW_BACKGROUND_INPUT/config.lua` para confirmar el modo guardado.
