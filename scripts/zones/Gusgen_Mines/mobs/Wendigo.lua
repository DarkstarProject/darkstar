-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Wendigo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,679,1);
   checkGoVregime(killer,mob,680,2);
end;