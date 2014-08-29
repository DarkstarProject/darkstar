-----------------------------------
-- Area: Korroloka Tunnel
-- MOB:  Lacerator
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,734,1);
end;