-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Madfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,686,2);
end;