-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Funnel Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,611,1);
end;
