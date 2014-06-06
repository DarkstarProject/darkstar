-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Hellbound Warlock
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,678,1);
end;