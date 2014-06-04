-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Labyrinth Scorpion
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,700,2);
end;