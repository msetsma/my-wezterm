local wezterm = require 'wezterm'

local M = {}

function M.is_windows()
    return wezterm.target_triple == "x86_64-pc-windows-msvc"
end

function M.is_mac()
    return wezterm.target_triple == "x86_64-apple-darwin" or
           wezterm.target_triple == "aarch64-apple-darwin"
end

function M.get_home_dir()
    if M.is_windows() then
        return os.getenv("USERPROFILE")
    else
        return os.getenv("HOME")
    end
end

return M