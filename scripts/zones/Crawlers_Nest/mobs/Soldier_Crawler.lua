-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Soldier Crawler
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,688,1);
end;