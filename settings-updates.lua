--Here we disable the lubricated mode, and force the expensive mode for the loaders
--This means with this mod enabled, you'll always pay 5x inserters, and 5x belts of the appropriate tier to make a loader.

local loaders_mode = data.raw["string-setting"]["aai-loaders-mode"]

loaders_mode.hidden = true
loaders_mode.allowed_values = {"expensive"}
loaders_mode.default_value = "expensive"
