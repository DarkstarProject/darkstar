-----------------------------------
-- Area: Caedarva Mire
--  MOB: Jnun
-----------------------------------
require("scripts/globals/status")

function onMobInitialize(mob)
end

function onMobSpawn(mob)
end

function onMobFight(mob, target)
end

function onMobRoam(mob)
    if VanadielHour() >= 6 and VanadielHour() < 18 then -- Jnun's sleep during the day
        mob:AnimationSub(0)
        mob:AnimationSub(1)
        mob:setMobMod(MOBMOD_NO_MOVE, 1)
        mob:setAggressive(0)
    elseif VanadielHour() >= 18 or VanadielHour() < 6 then -- Jnun's awake at night
        mob:AnimationSub(1)
        mob:AnimationSub(0)
        mob:setMobMod(MOBMOD_NO_MOVE, 0)
        mob:setAggressive(1)
    end
end

function onMobDeath(mob, player, isKiller)
end