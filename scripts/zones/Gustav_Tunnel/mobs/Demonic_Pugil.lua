-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Demonic Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,766,2);
end;