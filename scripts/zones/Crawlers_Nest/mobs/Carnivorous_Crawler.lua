-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Carnivorous Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,697,2);
end;