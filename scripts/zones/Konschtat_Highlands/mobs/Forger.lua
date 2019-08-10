-----------------------------------
-- Area: Konschtat Highlands
--   NM: Forger
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobDeath(mob, player, isKiller)
end
