local wezterm = require 'wezterm'
local utils = require 'utils'

local config = wezterm.config_builder()

-- Load modular configurations
require('config.appearance')(config)
require('config.keybindings')(config)
require('config.platform_specific')(config)

-- Use utils for cross-platform configurations
config.default_cwd = utils.get_home_dir()

-- Scrollback
config.scrollback_lines = 10000

-- URL handling
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
    regex = '\\b\\w+://[\\w.-]+:[0-9]{2,5}\\S*\\b',
    format = '$0',
})

-- Status bar
wezterm.on('update-right-status', function(window, pane)
    local date = wezterm.strftime '%Y-%m-%d %H:%M'
    window:set_right_status(wezterm.format({
        { Text = date },
    }))
end)

return config