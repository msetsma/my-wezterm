local utils = require 'utils'

return function(config)
    if utils.is_windows() then
        config.default_prog = { 'powershell.exe' }
        config.launch_menu = {
            { label = 'PowerShell', args = { 'powershell.exe' } },
            { label = 'Command Prompt', args = { 'cmd.exe' } },
        }
    elseif utils.is_mac() then
        config.default_prog = { '/bin/zsh' }
        config.launch_menu = {
            { label = 'Zsh', args = { '/bin/zsh' } },
            { label = 'Bash', args = { '/bin/bash' } },
        }
    end
end