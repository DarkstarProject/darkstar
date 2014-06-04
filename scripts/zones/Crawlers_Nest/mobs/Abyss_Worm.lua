-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Abyss Worm
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,699,1);
   checkGoVregime(killer,mob,700,1);
end;