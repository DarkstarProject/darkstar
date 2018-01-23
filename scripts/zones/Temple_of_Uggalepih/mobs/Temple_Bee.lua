-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Temple Bee
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,790,2);
    checkGoVregime(player,mob,793,2);
end;