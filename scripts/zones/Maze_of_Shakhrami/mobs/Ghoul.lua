-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ghoul
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,697,1);
end;