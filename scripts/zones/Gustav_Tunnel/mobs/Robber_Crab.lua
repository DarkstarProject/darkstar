-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,765,1);
end;