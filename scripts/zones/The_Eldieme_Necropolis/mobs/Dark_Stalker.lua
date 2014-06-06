-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Dark Stalker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,672,1);
   checkGoVregime(killer,mob,673,1);
end;