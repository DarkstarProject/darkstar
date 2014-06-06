-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Accursed Sorcerer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,686,1);
end;