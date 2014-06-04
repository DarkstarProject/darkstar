-----------------------------------
-- Area: Ve'Lugannon Palace
-- MOB:  Enkidu
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,743,1);
   checkGoVregime(killer,mob,747,1);
end;