-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Ancient Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,698,2);
   checkGoVregime(killer,mob,699,2);
end;