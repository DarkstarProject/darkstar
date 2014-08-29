-----------------------------------
-- Area: Korroloka Tunnel
-- MOB:  Gigas Stonecarrier
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,733,1);
end;