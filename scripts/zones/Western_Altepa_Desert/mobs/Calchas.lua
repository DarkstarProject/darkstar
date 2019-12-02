-----------------------------------
-- Area: Western Altepa Desert
--   NM: Calchas
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 33)
end

function onMobDeath(mob, player, isKiller)
end
