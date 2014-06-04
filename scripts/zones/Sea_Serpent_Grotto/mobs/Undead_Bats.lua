-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Undead Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,804,2);
end;