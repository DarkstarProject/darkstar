-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Chamber Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,707,2);
end;