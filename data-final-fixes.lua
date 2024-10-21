-- data-final-fixes.lua

-- Define the loaders and their corresponding inserters and belts
local loaders = {
    ["aai-loader"] = {
        inserter = "inserter",
        belt = "transport-belt"
    },
    ["aai-fast-loader"] = {
        inserter = "long-handed-inserter",
        belt = "fast-transport-belt"
    },
    ["aai-express-loader"] = {
        inserter = "fast-inserter",
        belt = "express-transport-belt"
    }
}

-- Check if the "space-age" mod is enabled and add the turbo loader
if mods["space-age"] then
    loaders["aai-turbo-loader"] = {
        inserter = "bulk-inserter",
        belt = "turbo-transport-belt"
    }
end

-- Loop through each unlubricated loader recipe and modify it
for recipe_name, details in pairs(loaders) do
    -- Check if the recipe exists
    if data.raw.recipe[recipe_name] then
        local recipe = data.raw.recipe[recipe_name]

        -- Modify the ingredients of the unlubricated recipe directly
        recipe.ingredients = {
            {type = "item", name = details.belt, amount = 5},
            {type = "item", name = details.inserter, amount = 5}
        }

        -- Adjust the energy required if needed
        recipe.energy_required = 2
    end
end
