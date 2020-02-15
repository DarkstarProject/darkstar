require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.tonberry = function(mob)
    mob:addListener("DEATH", "TONBERRY_DEATH", function(mob, player)
        if player then
            local kills = player:getCharVar("EVERYONES_GRUDGE_KILLS")
            if (kills < 480) then
                player:setCharVar("EVERYONES_GRUDGE_KILLS", kills + 1)
            end
        end
    end)
end

return g_mixins.families.tonberry
