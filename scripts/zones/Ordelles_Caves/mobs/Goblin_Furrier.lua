-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goblin Furrier
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,657,1);
end;