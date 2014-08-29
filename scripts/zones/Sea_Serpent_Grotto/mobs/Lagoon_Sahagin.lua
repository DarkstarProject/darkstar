-----------------------------------
-- Area: Seas Serpent Grotto
-- MOB:  Lagoon Sahagin
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,806,1);
   checkGoVregime(killer,mob,807,1);
   checkGoVregime(killer,mob,808,1);
end;