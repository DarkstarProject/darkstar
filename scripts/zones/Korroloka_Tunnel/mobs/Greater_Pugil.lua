-----------------------------------
-- Area: Korroloka Tunnel
-- MOB:  Greater Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,731,2);
end;