-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Worker Crawler
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,687,1);
end;