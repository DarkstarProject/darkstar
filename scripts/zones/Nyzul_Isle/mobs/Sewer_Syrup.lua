-----------------------------------
--  MOB: Sewer Syrup
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
require("scripts/zones/Nyzul_Isle/globals")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES then
        instance:setProgress(instance:getProgress() + 1)
    end
end