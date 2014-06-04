-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Wraith
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,708,3);
end;