-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Swagger Spruce
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,662,2);
end;