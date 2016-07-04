-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,695,1);
end;