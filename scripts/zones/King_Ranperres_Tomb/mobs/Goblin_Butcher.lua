-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Butcher
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,631,2);
    checkGoVregime(player,mob,633,3);
end;