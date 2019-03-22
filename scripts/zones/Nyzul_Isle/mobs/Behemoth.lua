-----------------------------------
--  MOB: Behemoth
-- Area: Nyzul Isle
-- Info: Floor 20 and 40 Boss
-- 
-----------------------------------

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
end

function onMobFight(mob,target)
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    
    if isKiller then
        instance:setProgress(15)
    end
end