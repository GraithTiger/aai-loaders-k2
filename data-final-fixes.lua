-- data-final-fixes.lua

-- Define the loaders and their corresponding inserters and belts
local loaders = {
    ["aai-loader"] = {
        loader = "iron-plate",
        belt = "transport-belt",
        gear = "iron-gear-wheel",
        energy_required = 1
    },
    ["aai-fast-loader"] = {
        loader = "aai-loader",
        belt = "fast-transport-belt",
        gear = "iron-gear-wheel",
        energy_required = 2
    },
    ["aai-express-loader"] = {
        loader = "aai-fast-loader",
        belt = "express-transport-belt",
        gear = "steel-plate",
        energy_required = 3
    }
}

-- Check if the "space-age" mod is enabled and add the turbo loader
if mods["space-age"] then
    loaders["aai-turbo-loader"] = {
        loader = "aai-express-loader",
        belt = "turbo-transport-belt",
        gear = "tungsten-plate",
        energy_required = 4
    }
end

-- Loop through each unlubricated loader recipe and modify it
for recipe_name, details in pairs(loaders) do
    -- Check if the recipe exists
    if data.raw.recipe[recipe_name] then
        local recipe = data.raw.recipe[recipe_name]

        -- Modify the ingredients of the unlubricated recipe directly
        recipe.ingredients = {
            {type = "item", name = details.belt, amount = 1},
            {type = "item", name = details.loader, amount = 2},
            {type = "item", name = details.gear, amount = 10}
        }

        -- Adjust the energy required if needed
        recipe.energy_required = details.energy_required
    end
end
