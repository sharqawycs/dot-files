-- bindings/media.lua

-- OSD client targets focused monitor
local osd = function(args)
    return hl.dsp.exec_cmd(
        'swayosd-client --monitor "$(hyprctl monitors -j | jq -r \'.[] | select(.focused == true).name\')" ' .. args
    )
end

local rep_lock = { repeating = true, locked = true, description = "" }
local function rld(d) return { repeating = true, locked = true, description = d } end
local function ld(d)  return { locked = true, description = d } end

-- Laptop media keys (volume + brightness) — repeat + locked
hl.bind("XF86AudioRaiseVolume",  osd("--output-volume raise"),       rld("Volume up"))
hl.bind("XF86AudioLowerVolume",  osd("--output-volume lower"),       rld("Volume down"))
hl.bind("XF86AudioMute",         osd("--output-volume mute-toggle"), rld("Mute"))
hl.bind("XF86AudioMicMute",      osd("--input-volume mute-toggle"),  rld("Mute microphone"))
hl.bind("XF86MonBrightnessUp",   osd("--brightness raise"),          rld("Brightness up"))
hl.bind("XF86MonBrightnessDown", osd("--brightness lower"),          rld("Brightness down"))

-- Playerctl (locked only, no repeat)
hl.bind("XF86AudioNext",  osd("--playerctl next"),        ld("Next track"))
hl.bind("XF86AudioPause", osd("--playerctl play-pause"),  ld("Pause"))
hl.bind("XF86AudioPlay",  osd("--playerctl play-pause"),  ld("Play"))
hl.bind("XF86AudioPrev",  osd("--playerctl previous"),    ld("Previous track"))

-- SUPER+CTRL multimedia (non-laptop keyboards)
hl.bind("SUPER + CTRL + 0",         osd("--output-volume mute-toggle"), rld("Mute"))
hl.bind("SUPER + CTRL + code:20",   osd("--output-volume lower"),       rld("Volume down"))
hl.bind("SUPER + CTRL + code:21",   osd("--output-volume raise"),       rld("Volume up"))
hl.bind("SUPER + CTRL + J",         osd("--playerctl previous"),        ld("Previous track"))
hl.bind("SUPER + CTRL + K",         osd("--playerctl play-pause"),      ld("Play/Pause"))
hl.bind("SUPER + CTRL + L",         osd("--playerctl next"),            ld("Next track"))

-- External monitor brightness via ddcutil (locked, no repeat)
-- hl.bind("SUPER + CTRL + O", hl.dsp.exec_cmd("ddcutil setvcp 10 - 10"), ld("External display brightness down"))
-- hl.bind("SUPER + CTRL + P", hl.dsp.exec_cmd("ddcutil setvcp 10 + 10"), ld("External display brightness up"))

-- Toggle audio output
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("~/bin/cmd-toggle-audio"), ld("Switch audio output"))
