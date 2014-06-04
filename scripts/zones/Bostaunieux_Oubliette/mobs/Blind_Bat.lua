-----------------------------------
-- Area: Bostaunieux Oubliette
-- MOB:  Blind Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,615,1);
   checkGoVregime(killer,mob,617,2);
end;
