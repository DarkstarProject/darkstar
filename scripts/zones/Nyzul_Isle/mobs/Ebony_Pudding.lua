-----------------------------------
--  MOB: Ebony Pudding
-- Area: Nyzul Isle
-- Info: Specified Mob Group
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (instance:getStage() == nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES or instance:getStage() == nyzul.objective.ELIMINATE_ALL_ENEMIES) and isKiller then
        instance:setProgress(instance:getProgress() +1)
    end
end