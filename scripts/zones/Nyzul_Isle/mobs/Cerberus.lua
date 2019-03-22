-----------------------------------
--  MOB: Cerberus
-- Area: Nyzul Isle
-- Info: Floor 60 80 and 100 Boss
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
end

function onMobFight(mob,target)
    if mob:getHPP() > 25 then
        mob:setMod(dsp.mod.REGAIN, 10)
    else
        mob:setMod(dsp.mod.REGAIN, 70)
    end
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance()
    
    if isKiller then
        instance:setProgress(15)
    end
end