-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Ovinnik
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,741,1);
end;