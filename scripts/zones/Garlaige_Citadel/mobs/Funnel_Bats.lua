-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Funnel Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,706,1);
end;