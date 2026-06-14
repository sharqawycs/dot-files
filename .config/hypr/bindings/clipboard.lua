-- bindings/clipboard.lua

local desc = function(d) return { description = d } end
local rep  = function(d) return { repeating = true, description = d } end

-- Copy / Paste / Cut
hl.bind("SUPER + C",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "Insert" }), desc("Universal copy"))
hl.bind("SUPER + V",       hl.dsp.send_shortcut({ mods = "SHIFT",      key = "Insert" }), desc("Universal paste"))
hl.bind("SUPER + X",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "X" }),      rep("Universal cut"))
hl.bind("SUPER + A",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "A" }),      rep("Select all"))
hl.bind("SUPER + Z",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "Z" }),      rep("Undo"))
hl.bind("SUPER + SHIFT + Z", hl.dsp.send_shortcut({ mods = "CTRL+SHIFT", key = "Z" }),    rep("Redo"))
hl.bind("SUPER + S",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "S" }),      rep("Save"))
hl.bind("SUPER + slash",   hl.dsp.send_shortcut({ mods = "CTRL",       key = "slash" }),  rep("Comment line"))
hl.bind("SUPER + O",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "O" }),      rep("Open"))
hl.bind("SUPER + N",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "N" }),      rep("New"))
hl.bind("SUPER + T",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "T" }),      rep("New tab"))
hl.bind("SUPER + P",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "P" }),      rep("Print"))
hl.bind("SUPER + R",       hl.dsp.send_shortcut({ mods = "CTRL",       key = "R" }),      rep("Refresh/Reload"))
hl.bind("SUPER + SHIFT + R", hl.dsp.send_shortcut({ mods = "CTRL+SHIFT", key = "R" }),    rep("Hard refresh"))

-- Clipboard manager
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd(
    [[clipvault list | tofi --width 700 --height 400 | clipvault get | wl-copy]]
), desc("Clipboard manager"))
