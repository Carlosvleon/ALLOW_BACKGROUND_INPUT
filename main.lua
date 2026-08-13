-- Allow Background Input mod
-- Configurable in-game via the options menu (see `M.setting` / `M.options`).

local love = love
local M = {}

-- Simple debug logger: appends to %APPDATA%/pokemon-love2d/mods/ALLOW_BACKGROUND_INPUT/debug.txt
local function dbg_write(line)
  local ok, err = pcall(function()
    local appdata = os.getenv("APPDATA") or "."
    local path = appdata .. "\\pokemon-love2d\\mods\\debug_allow_background_input.txt"
    local f = io.open(path, "a+")
    if f then
      f:write(os.date("%Y-%m-%d %H:%M:%S") .. " - " .. tostring(line) .. "\n")
      f:close()
    end
  end)
  if not ok then
    -- swallowing errors to avoid crashing the game during logging
  end
end
dbg_write("INIT")

local config_path = "mods/ALLOW_BACKGROUND_INPUT/config.lua"
local modes = {"disabled", "keyboard", "joystick", "both"}
local mode_index = 1
local mode = modes[mode_index]

local prev_keys = {}
local monitored_keys = {"up","down","left","right","z","x","return","space","escape"}

local prev_js_buttons = {}

local function read_config()
  local f = io.open(config_path, "r")
  if not f then return end
  local chunk = f:read("*a")
  f:close()
  local ok, tbl = pcall(loadstring(chunk))
  if ok and type(tbl) == "table" and tbl.mode then
    for i,v in ipairs(modes) do if v == tbl.mode then mode_index = i; mode = v; break end end
  end
end

local function write_config()
  local f = io.open(config_path, "w+")
  if not f then return end
  f:write("return { mode = '" .. tostring(mode) .. "' }\n")
  f:close()
end

local function cycle_mode()
  mode_index = mode_index % #modes + 1
  mode = modes[mode_index]
  write_config()
  print("[ALLOW_BACKGROUND_INPUT] mode -> " .. mode)
end

local function poll_keyboard(dt)
  for _,k in ipairs(monitored_keys) do
    local down = love.keyboard.isDown(k)
    if down and not prev_keys[k] then
      love.event.push("keypressed", k, nil, false)
    elseif not down and prev_keys[k] then
      love.event.push("keyreleased", k, nil, false)
    end
    prev_keys[k] = down
  end
end

local function poll_joystick(dt)
  local sticks = love.joystick.getJoysticks()
  for _,stick in ipairs(sticks) do
    local id = tostring(stick)
    local btn_count = stick:getButtonCount() or 0
    prev_js_buttons[id] = prev_js_buttons[id] or {}
    for b = 1, btn_count do
      local down = stick:isDown(b)
      if down and not prev_js_buttons[id][b] then
        love.event.push("joystickpressed", stick, b)
      elseif not down and prev_js_buttons[id][b] then
        love.event.push("joystickreleased", stick, b)
      end
      prev_js_buttons[id][b] = down
    end
    -- axes: convert large axis motion into axis events when crossing thresholds
    -- (optional, engines usually read axes directly)
  end
end



function love.update(dt)
  -- when window not focused and mode enabled, poll and inject events
  local has_focus = love.window and love.window.hasFocus and love.window.hasFocus()
  if not has_focus then
    if mode == "keyboard" or mode == "both" then poll_keyboard(dt) end
    if mode == "joystick" or mode == "both" then poll_joystick(dt) end
  end
end
-- Wrap existing `love` callbacks instead of replacing them. Replacing
-- `love.update` outright prevents the engine from running its own tick
-- logic and will hang the game; wrapping preserves previous behavior.

local _old_update = love.update
local _old_keypressed = love.keypressed
local _first_update = true

love.keypressed = function(k, scancode, isrepeat)
  if _old_keypressed then
    pcall(_old_keypressed, k, scancode, isrepeat)
  end
  -- no built-in shortcut by default; menu exposes the setting instead
end

love.update = function(dt)
  if _old_update then
    pcall(_old_update, dt)
  end
  if _first_update then
    dbg_write("UPDATE_FIRST")
    _first_update = false
  end
  -- when window not focused and mode enabled, poll and inject events
  local has_focus = love.window and love.window.hasFocus and love.window.hasFocus()
  if not has_focus then
    if mode == "keyboard" or mode == "both" then poll_keyboard(dt) end
    if mode == "joystick" or mode == "both" then poll_joystick(dt) end
  end
end

-- Mod API for basic display in engine options if supported by engine
M.name = "Allow Background Input"
M.description = "Allow playing while window is inactive. Modes: disabled, keyboard, joystick, both."
-- Expose a setting object so the engine's options menu can display and change it.
M.setting = {
  name = "Allow Background Input",
  description = "When unfocused, poll and inject input: disabled/keyboard/joystick/both",
  choices = modes,
  get = function() return mode end,
  set = function(val)
    if M.set_mode(val) then return true end
    return false
  end,
}

-- Some engines expect an `options` table listing rows; provide one row referencing `M.setting`.
M.options = {
  { M.setting, "Allow input while window inactive (disabled/keyboard/joystick/both)", cat = "controls", full = false },
}
M.cycle_mode = cycle_mode
M.get_mode = function() return mode end
M.set_mode = function(m)
  for i,v in ipairs(modes) do if v == m then mode_index = i; mode = v; write_config(); return true end end
  return false
end

-- Init
read_config()
print("[ALLOW_BACKGROUND_INPUT] started, mode = " .. tostring(mode))

return M
