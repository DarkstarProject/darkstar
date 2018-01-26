-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Blackwater Pugil
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,624,1);
end;
