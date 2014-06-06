-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Six of Coins
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,665,4);
end;