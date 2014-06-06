-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Deathwatch Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,652,1);
end;