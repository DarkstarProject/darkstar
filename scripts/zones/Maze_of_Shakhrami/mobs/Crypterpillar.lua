-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Crypterpillar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,702,2);
end;