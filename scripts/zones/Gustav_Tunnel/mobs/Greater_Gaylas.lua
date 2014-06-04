-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Greater Gaylas
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,763,3);
end;