-----------------------------------
-- Area: Ve'Lugannon Palace
-- MOB:  Caretaker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,743,1);
   checkGoVregime(killer,mob,746,1);
end;