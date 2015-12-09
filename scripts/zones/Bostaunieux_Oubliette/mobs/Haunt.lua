-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Haunt
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,612,2);
end;
