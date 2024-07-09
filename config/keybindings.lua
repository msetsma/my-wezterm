local wezterm = require 'wezterm'

return function(config)
    config.keys = {
        -- Launcher 
        { key = 'L', mods = 'CTRL|SHIFT', action = wezterm.action.ShowLauncher },

        -- Paste from clipboard
        { key = 'V', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
        { key = 'V', mods = 'CMD', action = wezterm.action.PasteFrom 'Clipboard' },

        -- New tab
        { key = 'T', mods = 'CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
        { key = 'T', mods = 'CMD', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },

        -- Close tab
        { key = 'W', mods = 'CTRL', action = wezterm.action.CloseCurrentTab{ confirm = true } },
        { key = 'W', mods = 'CMD', action = wezterm.action.CloseCurrentTab{ confirm = true } },

        -- Split panes
        { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

        -- Navigate panes
        { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },
    }

    config.mouse_bindings = {
        -- Right click to paste
        {
            event = { Down = { streak = 1, button = 'Right' } },
            mods = 'NONE',
            action = wezterm.action.PasteFrom 'Clipboard',
        },
    }
end