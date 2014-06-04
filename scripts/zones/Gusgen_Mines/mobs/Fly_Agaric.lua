-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Fly Agaric
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,680,1);
end;