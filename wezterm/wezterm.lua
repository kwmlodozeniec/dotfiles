local wezterm = require 'wezterm';

local mykeys = {}
for i = 1, 8 do
    -- CTRL+ALT + number to activate that tab
    table.insert(mykeys, {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action {
            ActivateTab = i - 1
        }
    })
end

return {
    font = wezterm.font_with_fallback({"Cascadia Code", "Symbols Nerd Font"}),
    font_size = 12,
    color_scheme = "Gruvbox Dark",
    use_fancy_tab_bar = true,
    tab_max_width = 30,
    keys = mykeys
}
