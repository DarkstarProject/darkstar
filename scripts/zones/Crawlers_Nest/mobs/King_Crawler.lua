-----------------------------------
-- Area: Crawlers' Nest
--  MOB: King Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,693,1);
end;