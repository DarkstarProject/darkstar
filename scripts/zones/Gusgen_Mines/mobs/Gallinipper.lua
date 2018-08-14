-----------------------------------
-- Area: Gusgen Mines
--  MOB: Gallinipper
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,684,2);
end;