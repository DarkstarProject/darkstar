-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Natty Gibbon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,646,2);
end;