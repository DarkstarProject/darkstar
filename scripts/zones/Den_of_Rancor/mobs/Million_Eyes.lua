-----------------------------------
-- Area: Den of Rancor
--  MOB: Million Eyes
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,800,1);
end;