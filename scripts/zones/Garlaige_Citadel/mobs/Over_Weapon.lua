-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Over Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,705,1);
   checkGoVregime(killer,mob,708,1);
end;