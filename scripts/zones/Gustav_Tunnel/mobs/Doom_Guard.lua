-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Doom Guard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,765,2);
   checkGoVregime(killer,mob,767,1);
   checkGoVregime(killer,mob,768,1);
end;