-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Goblin Mugger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,695,1);
end;