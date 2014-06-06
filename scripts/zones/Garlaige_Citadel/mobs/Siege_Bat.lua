-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Siege Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,704,1);
end;