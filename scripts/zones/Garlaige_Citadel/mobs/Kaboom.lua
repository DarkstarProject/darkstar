-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Kaboom
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,709,2);
end;