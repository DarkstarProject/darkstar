-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Dragonfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,691,3);
end;