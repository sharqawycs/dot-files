-- Learn how to configure Hyprland: https://wiki.hyprland.org/Configuring/
-- hyprland.lua — main entry point
-- Hyprland 0.55+ Lua config

require("envs")
require("monitors")
require("input")
require("looknfeel")
require("windows")
require("startup")

-- bindings
require("bindings/clipboard")
require("bindings/media")
require("bindings/tiling")
require("bindings/utilities")
