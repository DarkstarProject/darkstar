-----------------------------------
-- Area: Gusgen Mines
--  MOB: Amphisbaena
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,682,2);
end;