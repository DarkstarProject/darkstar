-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Donjon Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,709,1);
end;