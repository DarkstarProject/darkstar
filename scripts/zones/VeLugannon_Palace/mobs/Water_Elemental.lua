-----------------------------------
-- Area: Ve'Lugannon Palace
-- MOB:  Water Elemental
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,748,1);
end;