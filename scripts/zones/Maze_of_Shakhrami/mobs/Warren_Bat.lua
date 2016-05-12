-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Warren Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,702,1);
end;