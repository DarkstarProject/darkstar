-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Knight Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,692,2);
end;