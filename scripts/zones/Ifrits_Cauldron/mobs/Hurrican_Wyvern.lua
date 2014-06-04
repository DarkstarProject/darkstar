-----------------------------------
-- Area: Ifrit's Cauldron
-- MOB:  Hurricane Wyvern
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,762,1);
end;