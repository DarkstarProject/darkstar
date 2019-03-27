-----------------------------------
--  MOB: Heraldic Imp
-- Area: Nyzul Isle
-- Info: Specified Mob Group
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if isKiller then
        instance:setProgress(instance:getProgress() +1)
    end
end