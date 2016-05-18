-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Battle Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,649,1);
end;