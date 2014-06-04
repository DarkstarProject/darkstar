-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Boulder Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,770,1);
end;