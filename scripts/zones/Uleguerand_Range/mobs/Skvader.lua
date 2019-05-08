-----------------------------------
-- Area: Uleguerand Range
--   NM: Skvader
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 20)
end

function onMobDeath(mob, player, isKiller)
end
