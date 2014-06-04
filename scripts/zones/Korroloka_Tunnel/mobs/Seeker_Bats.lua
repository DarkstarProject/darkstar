-----------------------------------
-- Area: Korroloka Tunnel
-- MOB:  Seeker Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,727,2);
   checkGoVregime(killer,mob,728,1);
end;