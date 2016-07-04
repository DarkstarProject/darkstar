-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ghoul
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,697,1);
end;