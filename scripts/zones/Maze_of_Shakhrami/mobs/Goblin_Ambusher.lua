-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Goblin Ambusher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,695,1);
end;