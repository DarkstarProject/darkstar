-----------------------------------
-- Area: Den of Rancor
--  MOB: Demonic Pugil
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,801,1);
end;