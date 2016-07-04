-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Fly Agaric
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,656,1);
end;