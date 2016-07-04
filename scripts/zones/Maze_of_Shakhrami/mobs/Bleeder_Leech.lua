-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Bleeder Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,701,2);
end;