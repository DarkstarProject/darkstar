-----------------------------------
-- Area: Ifrit's Cauldron
-- MOB:  Eotyrannus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,758,1);
end;