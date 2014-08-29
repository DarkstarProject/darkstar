-----------------------------------
-- Area: Ve'Lugannon Palace
-- MOB:  Dustbuster
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,743,1);
   checkGoVregime(killer,mob,745,1);
end;