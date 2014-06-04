-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Greatclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,811,2);
end;