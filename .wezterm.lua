local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux
local config = wezterm.config_builder()
local workspace_colors_file = wezterm.home_dir .. '/.wezterm-workspace-colors.lua'
local term_keys = {
  enable_kitty_keyboard = true,
  keys = {
    {key = "`", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2a\x62\x1f"}},
    {key = "~", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2a\x63\x1f"}},
    {key = "`", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2a\x66\x1f"}},
    {key = "~", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2a\x67\x1f"}},
    {key = "1", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2b\x42\x1f"}},
    {key = "!", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2b\x43\x1f"}},
    {key = "1", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2b\x46\x1f"}},
    {key = "!", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2b\x47\x1f"}},
    {key = "2", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2c\x22\x1f"}},
    {key = "@", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2c\x23\x1f"}},
    {key = "2", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2c\x26\x1f"}},
    {key = "@", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2c\x27\x1f"}},
    {key = "3", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2c\x62\x1f"}},
    {key = "#", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2c\x63\x1f"}},
    {key = "3", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2c\x66\x1f"}},
    {key = "#", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2c\x67\x1f"}},
    {key = "4", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2d\x42\x1f"}},
    {key = "$", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2d\x43\x1f"}},
    {key = "4", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2d\x46\x1f"}},
    {key = "$", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2d\x47\x1f"}},
    {key = "5", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2e\x22\x1f"}},
    {key = "%", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2e\x23\x1f"}},
    {key = "5", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2e\x26\x1f"}},
    {key = "%", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2e\x27\x1f"}},
    {key = "6", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2e\x62\x1f"}},
    {key = "^", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2e\x63\x1f"}},
    {key = "6", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2e\x66\x1f"}},
    {key = "^", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2e\x67\x1f"}},
    {key = "7", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x2f\x42\x1f"}},
    {key = "&", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x2f\x43\x1f"}},
    {key = "7", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2f\x46\x1f"}},
    {key = "&", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x2f\x47\x1f"}},
    {key = "8", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x30\x22\x1f"}},
    {key = "*", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x30\x23\x1f"}},
    {key = "8", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x30\x26\x1f"}},
    {key = "*", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x30\x27\x1f"}},
    {key = "9", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x30\x62\x1f"}},
    {key = "(", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x30\x63\x1f"}},
    {key = "9", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x30\x66\x1f"}},
    {key = "(", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x30\x67\x1f"}},
    {key = "0", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x31\x42\x1f"}},
    {key = ")", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x31\x43\x1f"}},
    {key = "0", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x31\x46\x1f"}},
    {key = ")", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x31\x47\x1f"}},
    {key = "-", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x32\x22\x1f"}},
    {key = "_", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x32\x23\x1f"}},
    {key = "-", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x32\x26\x1f"}},
    {key = "_", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x32\x27\x1f"}},
    {key = "=", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x32\x62\x1f"}},
    {key = "+", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x32\x63\x1f"}},
    {key = "=", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x32\x66\x1f"}},
    {key = "+", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x32\x67\x1f"}},
    {key = "Backspace", mods = "SHIFT", action = wezterm.action{SendString="\x1b\x1f\x33\x41\x1f"}},
    {key = "Backspace", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x33\x42\x1f"}},
    {key = "Backspace", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x33\x43\x1f"}},
    {key = "Backspace", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x33\x45\x1f"}},
    {key = "Backspace", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x33\x46\x1f"}},
    {key = "Backspace", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x33\x47\x1f"}},
    {key = "Tab", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x34\x22\x1f"}},
    {key = "Tab", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x34\x23\x1f"}},
    {key = "Tab", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x34\x26\x1f"}},
    {key = "Tab", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x34\x27\x1f"}},
    {key = "Q", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x34\x63\x1f"}},
    {key = "Q", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x34\x67\x1f"}},
    {key = "W", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x35\x43\x1f"}},
    {key = "W", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x35\x47\x1f"}},
    {key = "E", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x36\x23\x1f"}},
    {key = "E", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x36\x27\x1f"}},
    {key = "R", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x36\x63\x1f"}},
    {key = "R", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x36\x67\x1f"}},
    {key = "T", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x37\x43\x1f"}},
    {key = "T", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x37\x47\x1f"}},
    {key = "Y", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x38\x23\x1f"}},
    {key = "Y", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x38\x27\x1f"}},
    {key = "U", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x38\x63\x1f"}},
    {key = "U", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x38\x67\x1f"}},
    {key = "I", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x39\x43\x1f"}},
    {key = "I", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x39\x47\x1f"}},
    {key = "O", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3a\x23\x1f"}},
    {key = "O", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3a\x27\x1f"}},
    {key = "P", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3a\x63\x1f"}},
    {key = "P", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3a\x67\x1f"}},
    {key = "[", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x3b\x42\x1f"}},
    {key = "{", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3b\x43\x1f"}},
    {key = "[", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3b\x46\x1f"}},
    {key = "{", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3b\x47\x1f"}},
    {key = "]", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x3c\x22\x1f"}},
    {key = "}", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3c\x23\x1f"}},
    {key = "]", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3c\x26\x1f"}},
    {key = "}", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3c\x27\x1f"}},
    {key = "Enter", mods = "SHIFT", action = wezterm.action{SendString="\x1b\x1f\x3c\x61\x1f"}},
    {key = "Enter", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x3c\x62\x1f"}},
    {key = "Enter", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3c\x63\x1f"}},
    {key = "Enter", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x3c\x65\x1f"}},
    {key = "Enter", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3c\x66\x1f"}},
    {key = "Enter", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3c\x67\x1f"}},
    {key = "A", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3e\x23\x1f"}},
    {key = "A", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3e\x27\x1f"}},
    {key = "S", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3e\x63\x1f"}},
    {key = "S", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3e\x67\x1f"}},
    {key = "D", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x3f\x43\x1f"}},
    {key = "D", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x3f\x47\x1f"}},
    {key = "F", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x40\x23\x1f"}},
    {key = "F", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x40\x27\x1f"}},
    {key = "G", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x40\x63\x1f"}},
    {key = "G", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x40\x66\x1f"}},
    {key = "G", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x40\x67\x1f"}},
    {key = "H", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x41\x43\x1f"}},
    {key = "H", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x41\x47\x1f"}},
    {key = "J", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x42\x23\x1f"}},
    {key = "J", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x42\x27\x1f"}},
    {key = "K", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x42\x63\x1f"}},
    {key = "K", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x42\x67\x1f"}},
    {key = "L", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x43\x43\x1f"}},
    {key = "L", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x43\x47\x1f"}},
    {key = ";", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x44\x22\x1f"}},
    {key = ":", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x44\x23\x1f"}},
    {key = ";", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x44\x26\x1f"}},
    {key = ":", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x44\x27\x1f"}},
    {key = "'", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x44\x62\x1f"}},
    {key = "\"", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x44\x63\x1f"}},
    {key = "'", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x44\x66\x1f"}},
    {key = "\"", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x44\x67\x1f"}},
    {key = "\\", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x46\x22\x1f"}},
    {key = "|", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x46\x23\x1f"}},
    {key = "\\", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x46\x26\x1f"}},
    {key = "|", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x46\x27\x1f"}},
    {key = "Z", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x46\x63\x1f"}},
    {key = "Z", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x46\x67\x1f"}},
    {key = "X", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x47\x43\x1f"}},
    {key = "X", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x47\x47\x1f"}},
    {key = "C", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x48\x23\x1f"}},
    {key = "C", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x48\x27\x1f"}},
    {key = "V", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x48\x63\x1f"}},
    {key = "V", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x48\x67\x1f"}},
    {key = "B", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x49\x43\x1f"}},
    {key = "B", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x49\x47\x1f"}},
    {key = "N", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x4a\x23\x1f"}},
    {key = "N", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4a\x27\x1f"}},
    {key = "M", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x4a\x63\x1f"}},
    {key = "M", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4a\x67\x1f"}},
    {key = ",", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x4b\x42\x1f"}},
    {key = "<", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x4b\x43\x1f"}},
    {key = ",", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4b\x46\x1f"}},
    {key = "<", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4b\x47\x1f"}},
    {key = ".", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x4c\x22\x1f"}},
    {key = ">", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x4c\x23\x1f"}},
    {key = ".", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4c\x26\x1f"}},
    {key = ">", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4c\x27\x1f"}},
    {key = "/", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x4c\x62\x1f"}},
    {key = "?", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x4c\x63\x1f"}},
    {key = "/", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4c\x66\x1f"}},
    {key = "?", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x4c\x67\x1f"}},
    {key = "Space", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x50\x22\x1f"}},
    {key = "Space", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x50\x23\x1f"}},
    {key = "Space", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x50\x26\x1f"}},
    {key = "Space", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x50\x27\x1f"}},
    {key = "Applications", mods = "", action = wezterm.action{SendString="\x1b\x1f\x52\x20\x1f"}},
    {key = "Applications", mods = "SHIFT", action = wezterm.action{SendString="\x1b\x1f\x52\x21\x1f"}},
    {key = "Applications", mods = "CTRL", action = wezterm.action{SendString="\x1b\x1f\x52\x22\x1f"}},
    {key = "Applications", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x52\x23\x1f"}},
    {key = "Applications", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x52\x24\x1f"}},
    {key = "Applications", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x52\x25\x1f"}},
    {key = "Applications", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x52\x26\x1f"}},
    {key = "Applications", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x52\x27\x1f"}},
    {key = "UpArrow", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x53\x43\x1f"}},
    {key = "UpArrow", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x53\x44\x1f"}},
    {key = "UpArrow", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x53\x45\x1f"}},
    {key = "UpArrow", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x53\x46\x1f"}},
    {key = "UpArrow", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x53\x47\x1f"}},
    {key = "DownArrow", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x54\x23\x1f"}},
    {key = "DownArrow", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x24\x1f"}},
    {key = "DownArrow", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x25\x1f"}},
    {key = "DownArrow", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x26\x1f"}},
    {key = "DownArrow", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x27\x1f"}},
    {key = "LeftArrow", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x54\x63\x1f"}},
    {key = "LeftArrow", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x64\x1f"}},
    {key = "LeftArrow", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x65\x1f"}},
    {key = "LeftArrow", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x66\x1f"}},
    {key = "LeftArrow", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x54\x67\x1f"}},
    {key = "RightArrow", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x55\x43\x1f"}},
    {key = "RightArrow", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x55\x44\x1f"}},
    {key = "RightArrow", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x55\x45\x1f"}},
    {key = "RightArrow", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x55\x46\x1f"}},
    {key = "RightArrow", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x55\x47\x1f"}},
    {key = "Home", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x57\x43\x1f"}},
    {key = "Home", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x57\x44\x1f"}},
    {key = "Home", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x57\x45\x1f"}},
    {key = "Home", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x57\x46\x1f"}},
    {key = "Home", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x57\x47\x1f"}},
    {key = "End", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x58\x23\x1f"}},
    {key = "End", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x24\x1f"}},
    {key = "End", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x25\x1f"}},
    {key = "End", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x26\x1f"}},
    {key = "End", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x27\x1f"}},
    {key = "PageUp", mods = "SHIFT", action = wezterm.action{SendString="\x1b\x1f\x58\x61\x1f"}},
    {key = "PageUp", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x58\x63\x1f"}},
    {key = "PageUp", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x64\x1f"}},
    {key = "PageUp", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x65\x1f"}},
    {key = "PageUp", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x66\x1f"}},
    {key = "PageUp", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x58\x67\x1f"}},
    {key = "PageDown", mods = "SHIFT", action = wezterm.action{SendString="\x1b\x1f\x59\x41\x1f"}},
    {key = "PageDown", mods = "SHIFT|CTRL", action = wezterm.action{SendString="\x1b\x1f\x59\x43\x1f"}},
    {key = "PageDown", mods = "ALT", action = wezterm.action{SendString="\x1b\x1f\x59\x44\x1f"}},
    {key = "PageDown", mods = "SHIFT|ALT", action = wezterm.action{SendString="\x1b\x1f\x59\x45\x1f"}},
    {key = "PageDown", mods = "CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x59\x46\x1f"}},
    {key = "PageDown", mods = "SHIFT|CTRL|ALT", action = wezterm.action{SendString="\x1b\x1f\x59\x47\x1f"}},
  },
}

local workspace_colors = {
  { id = 'red', label = 'Red', color = '#cc6666' },
  { id = 'orange', label = 'Orange', color = '#de935f' },
  { id = 'yellow', label = 'Yellow', color = '#f0c674' },
  { id = 'green', label = 'Green', color = '#b5bd68' },
  { id = 'cyan', label = 'Cyan', color = '#8abeb7' },
  { id = 'blue', label = 'Blue', color = '#81a2be' },
  { id = 'purple', label = 'Purple', color = '#b294bb' },
}
local workspace_menu_action_keys = 'scn'
local workspace_menu_prefix_keys = '1234567890abdefghijklmopqrtuvwxyz'

local function load_workspace_color_map()
  local chunk = loadfile(workspace_colors_file)
  if not chunk then
    return {}
  end

  local ok, data = pcall(chunk)
  if ok and type(data) == 'table' then
    return data
  end

  return {}
end

local function normalize_workspace_colors(value)
  if type(value) == 'string' then
    return { value }
  end

  if type(value) ~= 'table' then
    return {}
  end

  local colors = {}
  local seen = {}
  for _, color_id in ipairs(value) do
    if type(color_id) == 'string' and not seen[color_id] then
      table.insert(colors, color_id)
      seen[color_id] = true
    end
  end

  return colors
end

local function save_workspace_color_map(color_map)
  local file = io.open(workspace_colors_file, 'w')
  if not file then
    return
  end

  file:write('return {\n')
  for name, color_ids in pairs(color_map) do
    file:write('  [', string.format('%q', name), '] = { ')
    for _, color_id in ipairs(normalize_workspace_colors(color_ids)) do
      file:write(string.format('%q', color_id), ', ')
    end
    file:write('},\n')
  end
  file:write('}\n')
  file:close()
end

local function workspace_color_value(color_id)
  for _, entry in ipairs(workspace_colors) do
    if entry.id == color_id then
      return entry.color
    end
  end
end

local function workspace_label(name)
  local color_ids = normalize_workspace_colors(load_workspace_color_map()[name])
  if #color_ids == 0 then
    return name
  end

  local formatted = {
    { Text = name .. ' ' },
  }

  for _, color_id in ipairs(color_ids) do
    local color = workspace_color_value(color_id)
    if color then
      table.insert(formatted, { Foreground = { Color = color } })
      table.insert(formatted, { Text = '●' })
      table.insert(formatted, 'ResetAttributes')
    end
  end

  return wezterm.format(formatted)
end

local function set_workspace_color(name, color_id)
  local color_map = load_workspace_color_map()
  local colors = normalize_workspace_colors(color_map[name])
  for _, existing in ipairs(colors) do
    if existing == color_id then
      save_workspace_color_map(color_map)
      return
    end
  end

  table.insert(colors, color_id)
  color_map[name] = colors
  save_workspace_color_map(color_map)
end

local function clear_workspace_color(name)
  local color_map = load_workspace_color_map()
  color_map[name] = nil
  save_workspace_color_map(color_map)
end

local function rename_workspace_color(old_name, new_name)
  local color_map = load_workspace_color_map()
  if color_map[old_name] and old_name ~= new_name then
    color_map[new_name] = normalize_workspace_colors(color_map[old_name])
    color_map[old_name] = nil
    save_workspace_color_map(color_map)
  end
end

local function color_choices()
  local choices = {}
  for _, entry in ipairs(workspace_colors) do
    table.insert(choices, {
      id = '__set_color__' .. entry.id,
      label = wezterm.format {
        { Foreground = { Color = entry.color } },
        { Text = '● ' .. entry.label },
        'ResetAttributes',
      },
    })
  end

  return choices
end

local function workspace_choices()
  local names = mux.get_workspace_names()

  local choices = {}
  for _, name in ipairs(names) do
    table.insert(choices, {
      id = name,
      label = workspace_label(name),
    })
  end

  table.insert(choices, {
    id = '__set_current_workspace_color__',
    label = 'Set color for current workspace',
  })
  table.insert(choices, {
    id = '__clear_current_workspace_color__',
    label = 'Clear color for current workspace',
  })
  table.insert(choices, {
    id = '__create_new_workspace__',
    label = 'Create a new workspace',
  })

  return choices
end

local function workspace_menu_alphabet()
  local workspace_count = #mux.get_workspace_names()
  local prefix_length = math.min(workspace_count, #workspace_menu_prefix_keys)
  return workspace_menu_prefix_keys:sub(1, prefix_length) .. workspace_menu_action_keys
end

local function handle_workspace_menu_action(inner_window, inner_pane, id)
  if id == '__create_new_workspace__' then
    inner_window:perform_action(
      act.PromptInputLine {
        description = 'New workspace name',
        action = wezterm.action_callback(function(prompt_window, prompt_pane, line)
          if line and line ~= '' then
            prompt_window:perform_action(
              act.SwitchToWorkspace { name = line },
              prompt_pane
            )
          end
        end),
      },
      inner_pane
    )
    return
  end

  if id == '__set_current_workspace_color__' then
    inner_window:perform_action(
      act.InputSelector {
        title = 'Set workspace color',
        choices = color_choices(),
        fuzzy = false,
        description = 'Select a color for the current workspace',
        action = wezterm.action_callback(function(color_window, color_pane, color_id, color_label)
          if color_id and color_id:match('^__set_color__') then
            local selected = color_id:gsub('^__set_color__', '')
            set_workspace_color(color_window:active_workspace(), selected)
          end
        end),
      },
      inner_pane
    )
    return
  end

  if id == '__clear_current_workspace_color__' then
    clear_workspace_color(inner_window:active_workspace())
    return
  end

  if id then
    inner_window:perform_action(
      act.SwitchToWorkspace { name = id },
      inner_pane
    )
  end
end

-- Treat both Option keys as Alt/Meta in the terminal instead of macOS text composition
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.window_padding = {
  left = '0.5cell',
  right = '1cell',
  top = '0.25cell',
  bottom = '0.25cell',
}

config.font_size = 16.0

config.color_scheme = 'Zenburn'

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status('  ' .. workspace_label(window:active_workspace()) .. '  ')
end)

wezterm.on('new-tab-button-click', function(window, pane, button, default_action)
  if button == 'Right' then
    window:perform_action(
      act.InputSelector {
        title = 'Workspace menu',
        choices = workspace_choices(),
        fuzzy = false,
        alphabet = workspace_menu_alphabet(),
        description = 'Click a workspace to switch, or choose a workspace action',
        action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
          handle_workspace_menu_action(inner_window, inner_pane, id)
        end),
      },
      pane
    )
    return false
  end

  return default_action
end)

config.keys = {
  {
    key = 'l',
    mods = 'CMD|ALT',
    action = wezterm.action_callback(function(window, pane)
      window:perform_action(
        act.InputSelector {
          title = 'Switch to workspace',
          choices = workspace_choices(),
          fuzzy = false,
          alphabet = workspace_menu_alphabet(),
          description = 'Select a workspace, Enter = switch, / = filter, Esc = cancel',
          action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
            handle_workspace_menu_action(inner_window, inner_pane, id)
          end),
        },
        pane
      )
    end),
  },
  { key = "b", mods = "CMD|SHIFT", action = act.EmitEvent "split-and-build" },
  {
    key = 'w',
    mods = 'CMD|ALT',
    action = act.PromptInputLine {
      description = 'New workspace name',
      action = wezterm.action_callback(function(window, pane, line)
        if line and line ~= '' then
          window:perform_action(
            act.SwitchToWorkspace { name = line },
            pane
          )
        end
      end),
    },
  },
  {
    key = 'r',
    mods = 'CMD|ALT',
    action = act.PromptInputLine {
      description = 'Rename workspace to',
      action = wezterm.action_callback(function(window, pane, line)
        if line and line ~= '' then
          rename_workspace_color(window:active_workspace(), line)
          mux.rename_workspace(window:active_workspace(), line)
        end
      end),
    },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal {
      args = { 'ls' },
    }
  },
}

config.enable_kitty_keyboard = term_keys.enable_kitty_keyboard
for _, key in ipairs(term_keys.keys or {}) do
  table.insert(config.keys, key)
end



config.window_decorations = 'TITLE|RESIZE'

return config
