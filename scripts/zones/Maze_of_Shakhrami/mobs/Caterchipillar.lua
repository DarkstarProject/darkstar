-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Caterchipillar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,698,1);
end;