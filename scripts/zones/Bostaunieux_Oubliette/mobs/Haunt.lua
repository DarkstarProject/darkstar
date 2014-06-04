-----------------------------------
-- Area: Bostaunieux Oubliette
-- MOB:  Haunt
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,612,2);
end;
