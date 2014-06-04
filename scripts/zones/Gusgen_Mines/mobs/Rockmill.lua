-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Rockmill
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,685,2);
end;