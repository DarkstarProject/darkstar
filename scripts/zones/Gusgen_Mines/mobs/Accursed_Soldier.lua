-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Accursed Soldier
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,685,1);
end;