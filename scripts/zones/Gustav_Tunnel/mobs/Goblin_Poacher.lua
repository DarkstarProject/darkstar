-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Goblin Poacher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,764,3);
   checkGoVregime(killer,mob,765,3);
end;