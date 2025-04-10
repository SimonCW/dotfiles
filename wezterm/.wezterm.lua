local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "Catppuccin Mocha" -- Latte, Frappé, Macchiato, Mocha
config.font_size = 16
config.font = wezterm.font({ -- Normal text
	family = "Monaspace Neon",
	weight = "Medium",
	harfbuzz_features = { "calt", "liga" },
})

config.font_rules = {
	{ -- Italic
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			--family = "Monaspace Radon", -- script style
			family = "Monaspace Xenon", -- courier-like
			style = "Italic",
		}),
	},
	{ -- Bold
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "Monaspace Krypton",
			weight = "ExtraBold",
			-- weight = "Bold",
		}),
	},
	{ -- Bold Italic
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Monaspace Xenon",
			style = "Italic",
			weight = "Bold",
		}),
	},
}
config.native_macos_fullscreen_mode = true
config.pane_focus_follows_mouse = false
-- Necessary for my Moonlander Layout to work.
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.window_decorations = "TITLE | RESIZE"

--------------------
-- Adapted from: https://github.com/mrjones2014/smart-splits.nvim
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
-- ------------------
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "CTRL|SHIFT" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "CTRL|SHIFT" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

----------------
--- Key Mappings
----------------
-- Leader is the same as my old tmux prefix
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{ mods = "LEADER", key = "h", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "x", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "f", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	{ key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "w", mods = "LEADER", action = act.ShowTabNavigator },

	-- Navigation between panes and neovim using the smart-splits-function
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
}

return config
