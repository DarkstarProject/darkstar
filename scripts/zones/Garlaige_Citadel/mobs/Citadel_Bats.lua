-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Citadel Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,705,2);
end;