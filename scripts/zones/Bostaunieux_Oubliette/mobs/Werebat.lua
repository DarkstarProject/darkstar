-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Werebat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,611,2);
end;
