-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Doom Soldier
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,765,2);
end;