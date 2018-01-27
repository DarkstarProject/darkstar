-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Leecher
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,605,1);
end;
