-----------------------------------
-- Area: Ifrit's Cauldron
-- MOB:  Nightmare Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,760,1);
end;