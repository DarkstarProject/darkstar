-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Kuftal Digger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,739,1);
end;