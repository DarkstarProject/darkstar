-----------------------------------
-- Area: Promyvion-Vahzl
--   NM: Memory Receptacle
-----------------------------------
require("scripts/globals/promyvion")
-----------------------------------

function onMobInitialize(mob)
    mob:SetAutoAttackEnabled(false) -- Receptacles only use TP moves.
end

function onMobFight(mob, target)
    dsp.promyvion.receptacleOnFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
    dsp.promyvion.receptacleOnDeath(mob, isKiller)
end