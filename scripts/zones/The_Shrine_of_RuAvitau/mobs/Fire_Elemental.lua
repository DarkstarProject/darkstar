-----------------------------------
-- Area: Shrine of Ru'Avitau
-- MOB:  Fire Elemental
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,750,1);
end;