-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Haunt
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,736,2);
end;