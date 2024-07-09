local wezterm = require 'wezterm'

return function(config)
    -- Font configuration
    config.font = wezterm.font_with_fallback({
        'Fira Code',
        'Noto Color Emoji',
    })
    config.font_size = 11.0

    -- Color scheme
    config.color_scheme = 'Dracula'

    -- Window configuration
    config.window_background_opacity = 0.98
    config.window_padding = {
        left = 2,
        right = 2,
        top = 0,
        bottom = 0,
    }

    -- Tab bar
    config.use_fancy_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = false

    -- Cursor configuration
    config.default_cursor_style = 'SteadyBar'

    -- Custom tab title
    wezterm.on('format-tab-title', function(tab, hover, max_width)
        local title = tab.active_pane.title
        local index = tab.tab_index + 1
        local process = tab.active_pane.foreground_process_name or ''

        -- Color for active vs inactive tabs
        local background = tab.is_active and '#6272A4' or '#44475A'
        local foreground = tab.is_active and '#F8F8F2' or '#BFBFBF'

        -- Shorten process name
        process = process:gsub('%.exe$', '')

        -- Change color on hover
        if hover then
            background = '#BD93F9'
        end

        -- Show number of panes if more than one
        local pane_count = ''
        if #tab.panes > 1 then
            pane_count = string.format(' [%d]', #tab.panes)
        end

        -- Truncate title if needed
        local formatted_title = wezterm.truncate_right(title, max_width - 10)

        return {
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = string.format(' %d: %s%s %s ', index, process, pane_count, formatted_title) },
        }
    end)


end