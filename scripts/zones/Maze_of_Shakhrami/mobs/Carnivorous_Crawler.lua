-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Carnivorous Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,697,2);
end;