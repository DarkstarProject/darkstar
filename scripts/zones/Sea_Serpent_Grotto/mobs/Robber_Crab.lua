-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,809,1);
   checkGoVregime(killer,mob,810,1);
end;