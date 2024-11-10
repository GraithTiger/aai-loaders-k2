-- Disable AAI techs on mod initialization

script.on_init(function()
    for name, force in pairs(game.forces) do 
        force.technologies["aai-loader"].enabled = false
        force.technologies["aai-fast-loader"].enabled = false
        force.technologies["aai-express-loader"].enabled = false
        if script.active_mods["space-age"] then
            force.technologies["aai-turbo-loader"].enabled = false
        end
    end
end)