-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Combat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,696,2);
end;
