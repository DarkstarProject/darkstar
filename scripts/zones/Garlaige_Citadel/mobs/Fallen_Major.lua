-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Fallen Major
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,703,2);
end;