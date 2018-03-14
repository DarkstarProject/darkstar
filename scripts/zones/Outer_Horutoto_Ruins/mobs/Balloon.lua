-----------------------------------
-- Area: Outer Horutoto Ruins (194)
--  MOB: Balloon
-- Note: PH for Bomb King, Doppelganger Dio, and Doppelganger Gog
-----------------------------------
require("scripts/zones/Outer_Horutoto_Ruins/globals");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    OUTER_HORUTOTO_RUINS.balloonDespawn(mob);
end;
