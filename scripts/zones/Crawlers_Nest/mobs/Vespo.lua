-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Vespo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,693,2);
end;