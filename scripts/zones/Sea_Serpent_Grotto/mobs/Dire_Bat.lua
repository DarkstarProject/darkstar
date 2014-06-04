-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Dire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,809,2);
end;