-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Lich
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,671,1);
   checkGoVregime(killer,mob,674,1);
   checkGoVregime(killer,mob,675,2);
end;