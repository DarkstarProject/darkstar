-----------------------------------
-- Area: Quicksand Caves
--  MOB: Spelunking Sabotender
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,816,1);
end;