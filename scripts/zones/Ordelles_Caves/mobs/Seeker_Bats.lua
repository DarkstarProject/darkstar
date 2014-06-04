-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Seeker Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,658,1);
end;