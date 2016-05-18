-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Vorpal Bunny
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,658,2);
end;