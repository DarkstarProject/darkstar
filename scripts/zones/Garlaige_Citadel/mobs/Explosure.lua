-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Explosure
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,706,2);
end;