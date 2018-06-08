-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Crypterpillar
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,702,2);
end;