-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Wingrats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,703,1);
end;