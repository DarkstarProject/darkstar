-----------------------------------
-- Area: Korroloka Tunnel
-- MOB:  Combat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,728,2);
end;