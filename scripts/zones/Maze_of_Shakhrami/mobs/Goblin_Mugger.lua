-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Goblin Mugger
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,695,1);
end;