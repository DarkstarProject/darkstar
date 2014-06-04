-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Hawker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,764,1);
end;