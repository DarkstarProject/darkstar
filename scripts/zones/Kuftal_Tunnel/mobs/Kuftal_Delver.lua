-----------------------------------
-- Area: Kuftal Tunnel
-- MOB:  Kuftal Delver
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,742,1);
end;