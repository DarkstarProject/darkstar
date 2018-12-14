-----------------------------------
-- Area: Promyvion-Vahzl
--  MOB: Memory Receptacle
-----------------------------------
require("scripts/globals/promyvion")
-----------------------------------

function onMobInitialize(mob)
    mob:SetAutoAttackEnabled(false) -- Recepticles only use TP moves.
end

function onMobFight(mob, target)
    dsp.promyvion.receptacleOnFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    dsp.promyvion.receptacleOnDeath(mob, isKiller)
end