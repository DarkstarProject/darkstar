-----------------------------------
-- Area: Shrine of Ru'Avitau
-- MOB:  Dark Elemental
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,750,1);
end;