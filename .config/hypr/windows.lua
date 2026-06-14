-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- Suppress maximize events from all windows
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Fix XWayland drag issues
hl.window_rule({
    match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus = true,
})

-- LocalSend: float + center
hl.window_rule({ match = { class = "localsend" }, float = true, center = true })

-- Satty screenshot tool: float + center
hl.window_rule({ match = { class = "com.gabm.satty" }, float = true, center = true })

-- Thunar rename dialog: float + center
hl.window_rule({ match = { title = "Rename.*" }, float = true, center = true })

-- Picture-in-Picture
hl.window_rule({ match = { title = "Picture.?in.?[Pp]icture" }, tag = "+pip" })
hl.window_rule({
    match = { tag = "pip" },
    float = true,
    pin = true,
    size = { 600, 338 },
    keep_aspect_ratio = true,
    border_size = 0,
    opacity = "1 override 1 override",
    move = { "100%-w-40", "4%" },
})
