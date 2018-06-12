-----------------------------------
-- Area: Gusgen Mines
--  MOB: Rockmill
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,685,2);
end;