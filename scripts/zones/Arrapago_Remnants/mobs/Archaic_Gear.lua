-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Archaic Gear
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    if (instance:getStage() == 6 and instance:getProgress() >= 1) then
        if (isKiller) then
            instance:setProgress(instance:getProgress() + 1)
        end
    end
end

function onMobDespawn(mob)
end