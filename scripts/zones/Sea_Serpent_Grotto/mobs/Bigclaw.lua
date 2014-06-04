-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Bigclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,807,2);
end;