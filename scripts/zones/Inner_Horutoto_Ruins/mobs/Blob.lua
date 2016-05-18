-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Blob
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,649,2);
end;