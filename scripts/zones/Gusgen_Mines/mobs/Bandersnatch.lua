-----------------------------------
-- Area: Gusgen Mines
--  MOB: Bandersnatch
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,681,2);
end;