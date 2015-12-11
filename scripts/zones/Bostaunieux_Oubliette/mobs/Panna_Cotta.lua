-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Panna Cotta
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,614,2);
    checkGoVregime(ally,mob,615,2);
end;
