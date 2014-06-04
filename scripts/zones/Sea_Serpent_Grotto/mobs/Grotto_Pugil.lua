-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Grotto Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,808,2);
end;