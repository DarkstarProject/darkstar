-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--  Mob: Balloon
-- Note: PH for Bomb King, Doppelganger Dio, and Doppelganger Gog
-----------------------------------
local func = require("scripts/zones/Outer_Horutoto_Ruins/globals")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    func.balloonOnDespawn(mob)
end
