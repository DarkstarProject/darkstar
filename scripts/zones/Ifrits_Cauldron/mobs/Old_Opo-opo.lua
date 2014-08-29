-----------------------------------
-- Area: Ifrit's Cauldron
-- MOB:  Old Opo-opo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,756,1);
end;