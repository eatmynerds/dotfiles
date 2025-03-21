local wezterm = require("wezterm")

local font_size = 18
local font_family = ({
  "Liga SFMono Nerd Font",    -- [1]
  "BlexMono Nerd Font",       -- [2]
  "Iosevka Nerd Font",        -- [3]
  "JetBrainsMono Nerd Font",  -- [4]
  "FiraCode Nerd Font",       -- [5]
  "ComicCodeLigatures",       -- [6]
  "Nouveau IBM",              -- [7]
  "IBM Plex Mono",            -- [8]
  "Source Code Pro",          -- [9]
  "NotoSansMono Nerd Font",   -- [10]
  "FantasqueSansM Nerd Font", -- [11]
  "JetBrains Mono",           -- [12]
})[3]

-- Specify the font weight here (e.g., "Regular", "Bold", or numeric values like 400, 700)
local font_weight = "Bold"

-- Set font with weight
local font = wezterm.font(font_family, { weight = font_weight })

return { font = font, font_size = font_size }
