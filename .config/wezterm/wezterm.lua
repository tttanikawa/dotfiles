local wezterm = require "wezterm";

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font({
    family = "SFMono Nerd Font",
    weight = "Medium",
})
config.font_size = 16.0

config.color_scheme = "nord"
config.window_padding = {
    left = "2.0cell",
    right = "2.0cell",
    top = "2.0cell",
    bottom = "1.0cell",
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

local nord_color_dark = "#2E3440"
local nord_color_mid = "#434c5e"
local nord_color_light = "#d8dee9"
config.window_frame = {
    font = wezterm.font { family = 'Helvetica', weight = 'Regular' },
    font_size = 14.0,
    active_titlebar_bg = nord_color_dark,
    inactive_titlebar_bg = nord_color_dark,
}
config.colors = {
    tab_bar = {
        inactive_tab_edge = nord_color_dark,
        background = nord_color_dark,

        active_tab = {
            bg_color = nord_color_mid,
            fg_color = nord_color_light,
            intensity = 'Bold',
        },

        inactive_tab = {
            bg_color = nord_color_dark,
            fg_color = nord_color_light,
        },

        inactive_tab_hover = {
            bg_color = nord_color_mid,
            fg_color = nord_color_light,
        },

        new_tab = {
            bg_color = nord_color_dark,
            fg_color = nord_color_light,
        },

        new_tab_hover = {
            bg_color = nord_color_mid,
            fg_color = nord_color_light,
        },
    },
}
config.tab_bar_at_bottom = true
config.initial_rows = 48
config.initial_cols = 192

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
config.use_ime = true

return config
