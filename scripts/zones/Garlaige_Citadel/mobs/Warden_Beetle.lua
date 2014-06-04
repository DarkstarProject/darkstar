-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Warden Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,710,2);
end;