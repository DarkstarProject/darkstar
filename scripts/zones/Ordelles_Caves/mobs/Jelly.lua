-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Jelly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,659,2);
end;