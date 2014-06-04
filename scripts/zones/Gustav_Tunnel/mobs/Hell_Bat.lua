-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Hell Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,763,3);
end;