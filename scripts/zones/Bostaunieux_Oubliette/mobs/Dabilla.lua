-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Dabilla
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,612,1);
    checkGoVregime(ally,mob,614,1);
end;
