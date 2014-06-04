-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Machairodus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,742,2);
end;