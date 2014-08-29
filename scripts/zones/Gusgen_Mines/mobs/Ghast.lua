-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Ghast
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,679,1);
   checkGoVregime(killer,mob,680,2);
   checkGoVregime(killer,mob,684,1);
end;