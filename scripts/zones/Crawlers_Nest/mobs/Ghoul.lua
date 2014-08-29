-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Ghoul
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,697,1);
end;