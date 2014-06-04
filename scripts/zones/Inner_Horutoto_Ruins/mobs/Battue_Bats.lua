-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Battue Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,647,1);
end;