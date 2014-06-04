-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Blood Soul
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,674,2);
end;