-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Maze Maker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,696,1);
end;
