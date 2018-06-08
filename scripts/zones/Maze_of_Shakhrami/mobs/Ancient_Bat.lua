-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ancient Bat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,698,2);
    checkGoVregime(player,mob,699,2);
end;