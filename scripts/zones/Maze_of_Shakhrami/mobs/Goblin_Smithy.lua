-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Goblin Smithy
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,695,1);
end;