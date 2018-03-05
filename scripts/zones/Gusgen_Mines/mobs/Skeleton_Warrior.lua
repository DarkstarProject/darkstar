-----------------------------------
-- Area: Gusgen Mines
--  MOB: Skeleton Warrior
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,679,1);
    checkGoVregime(player,mob,680,2);
end;