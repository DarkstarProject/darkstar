-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Tomb Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,671,1);
   checkGoVregime(killer,mob,675,2);
   checkGoVregime(killer,mob,676,2);
end;