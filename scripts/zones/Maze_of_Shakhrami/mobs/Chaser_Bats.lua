-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Chaser Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,701,1);
end;