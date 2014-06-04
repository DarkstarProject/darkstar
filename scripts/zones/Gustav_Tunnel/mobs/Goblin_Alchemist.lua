-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Goblin Alchemist
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,764,3);
   checkGoVregime(killer,mob,765,3);
end;