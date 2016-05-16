-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Wind Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,602,1);
end;
