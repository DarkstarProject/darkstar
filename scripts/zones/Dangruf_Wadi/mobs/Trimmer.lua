-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Trimmer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,646,1);
end;