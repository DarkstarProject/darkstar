-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Bandersnatch
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,680,2);
end;