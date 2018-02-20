-----------------------------------
-- Area: Gusgen Mines
--  MOB: Ore Eater
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,681,1);
end;