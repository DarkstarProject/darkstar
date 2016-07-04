-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Combat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,696,2);
end;
