local wezterm = require "wezterm"
local config = wezterm.config_builder()
local projects = require 'projects'

config.set_environment_variables = {
    PATH = '/usr/local/bin:' .. os.getenv('PATH')
}

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font({
    family = "Monaspace Radon"
})
config.font_size = 16

config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_frame = {
    font = wezterm.font({
        family = "Monaspace Radon",
        weight = "Bold"
    }),
    font_size = 12
}

config.leader = {
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 1000
}

local function segments_for_right_status(window)
    return {window:active_workspace()}
end

local function move_to_pane(key, direction)
    return {
        key = key,
        mods = "OPT",
        action = wezterm.action.ActivatePaneDirection(direction)
    }
end

local function resize_pane(key, direction)
    return {
        key = key,
        action = wezterm.action.AdjustPaneSize {direction, 5}
    }
end

-- Remove all path components and return only the last value
local function remove_abs_path(path)
    return path:gsub("(.*[/\\])(.*)", "%2")
end

-- Return the Tab's current working directory
local function get_cwd(tab)
    return tab.active_pane.current_working_dir.file_path or ""
end

-- Return the pretty path of the tab's current working directory
local function get_display_cwd(tab)
    local current_dir = get_cwd(tab)
    return remove_abs_path(current_dir)
end

-- Pretty format the tab title
local function format_title(tab)
    local cwd = get_display_cwd(tab)

    return string.format(" %s ", cwd)
end

-- Returns manually set title (from `tab:set_title()` or `wezterm cli set-tab-title`) or creates a new one
local function get_tab_title(tab)
    local title = tab.tab_title
    if title and #title > 0 then
        return title
    end
    return format_title(tab)
end

-- On format tab title events, override the default handling to return a custom title
-- Docs: https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = get_tab_title(tab)
    if tab.is_active then
        return {{
            Text = title
        }}
    end
    return title
end)

wezterm.on('update-status', function(window, pane, _)
    local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
    local segments = segments_for_right_status(window)

    local color_scheme = window:effective_config().resolved_palette
    -- Note the use of wezterm.color.parse here, this returns
    -- a Color object, which comes with functionality for lightening
    -- or darkening the colour (amongst other things).
    local bg = wezterm.color.parse(color_scheme.background)
    local fg = color_scheme.foreground

    -- Each powerline segment is going to be coloured progressively
    -- darker/lighter depending on whether we're on a dark/light colour
    -- scheme. Let's establish the "from" and "to" bounds of our gradient.
    local gradient_to, gradient_from = bg
    gradient_from = gradient_to:lighten(0.2)

    -- Yes, WezTerm supports creating gradients, because why not?! Although
    -- they'd usually be used for setting high fidelity gradients on your terminal's
    -- background, we'll use them here to give us a sample of the powerline segment
    -- colours we need.
    local gradient = wezterm.color.gradient({
        orientation = 'Horizontal',
        colors = {gradient_from, gradient_to}
    }, #segments -- only gives us as many colours as we have segments.
    )

    -- We'll build up the elements to send to wezterm.format in this table.
    local elements = {}

    for i, seg in ipairs(segments) do
        local is_first = i == 1

        if is_first then
            table.insert(elements, {
                Background = {
                    Color = 'none'
                }
            })
        end
        table.insert(elements, {
            Foreground = {
                Color = gradient[i]
            }
        })
        table.insert(elements, {
            Text = SOLID_LEFT_ARROW
        })

        table.insert(elements, {
            Foreground = {
                Color = fg
            }
        })
        table.insert(elements, {
            Background = {
                Color = gradient[i]
            }
        })
        table.insert(elements, {
            Text = ' ' .. seg .. ' '
        })
    end

    window:set_right_status(wezterm.format(elements))
end)

config.keys = { -- Send ESC+b and ESC+f sequences, which is used
-- for telling your shell to jump back/forward
{
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action.SendString "\x1bb"
}, {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action.SendString "\x1bf"
}, {
    -- open config file in VSCode
    key = ",",
    mods = "SUPER",
    action = wezterm.action.SpawnCommandInNewTab {
        cwd = wezterm.home_dir,
        args = {"code", wezterm.config_file}
    }
}, {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal {
        domain = "CurrentPaneDomain"
    }
}, {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.SplitVertical {
        domain = "CurrentPaneDomain"
    }
}, {
    -- when in leader mode, send CTRL+a
    key = "a",
    mods = "LEADER|CTRL",
    action = wezterm.action.SendKey {
        key = "a",
        mods = "CTRL"
    }
}, {
    key = "PageUp",
    mods = "CTRL",
    action = wezterm.action.ActivateTabRelative(-1)
}, {
    key = "PageDown",
    mods = "CTRL",
    action = wezterm.action.ActivateTabRelative(1)
}, move_to_pane("DownArrow", "Down"), move_to_pane("UpArrow", "Up"), move_to_pane("LeftArrow", "Left"),
move_to_pane("RightArrow", "Right"), {
    -- When we push LEADER+r
    key = "r",
    mods = "LEADER",
    -- Activate the `resize_panes` keytable
    action = wezterm.action.ActivateKeyTable {
        name = "resize_panes",
        -- Ensure the keytable is active after it handles its
        -- first keypress
        one_shot = false,
        -- Deactivate the keytable after a timeout
        timeout_milliseconds = 1000
    }
}, {
    key = "p",
    mods = "LEADER",
    -- Present the projects picker
    action = projects.choose_project()
}, {
    key = "f",
    mods = "LEADER",
    -- Present a list of existing workspaces
    action = wezterm.action.ShowLauncherArgs {
        flags = "FUZZY|WORKSPACES"
    }
}}

config.key_tables = {
    resize_panes = {resize_pane("DownArrow", "Down"), resize_pane("UpArrow", "Up"), resize_pane("LeftArrow", "Left"),
                    resize_pane("RightArrow", "Right")}
}

return config
