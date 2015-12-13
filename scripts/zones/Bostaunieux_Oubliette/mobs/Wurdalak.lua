-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Wurdalak
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,617,1);
end;
