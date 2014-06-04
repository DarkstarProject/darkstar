-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Myconid
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,683,2);
end;