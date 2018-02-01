-----------------------------------
-- Area: Crawlers' Nest
--  MOB: King Crawler
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,693,1);
end;