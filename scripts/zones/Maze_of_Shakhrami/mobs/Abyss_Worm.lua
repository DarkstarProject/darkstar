-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Abyss Worm
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,699,1);
    checkGoVregime(player,mob,700,1);
end;