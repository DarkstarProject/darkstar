-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Labyrinth Scorpion
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,700,2);
end;