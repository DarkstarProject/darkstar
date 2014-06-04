-----------------------------------
-- Area: Ifrit's Cauldron
-- MOB:  Volcanic Gas
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,755,2);
   checkGoVregime(killer,mob,756,2);
   checkGoVregime(killer,mob,757,2);
   checkGoVregime(killer,mob,758,2);
   checkGoVregime(killer,mob,759,1);
end;