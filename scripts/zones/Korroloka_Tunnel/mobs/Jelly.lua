-----------------------------------
-- Area: Korroloka Tunnel
-- MOB:  Jelly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,729,2);
end;