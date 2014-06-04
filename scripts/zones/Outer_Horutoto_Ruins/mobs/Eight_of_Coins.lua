-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Eight of Coins
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,667,3);
end;