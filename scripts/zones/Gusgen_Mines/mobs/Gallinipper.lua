-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Gallinipper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,684,2);
end;