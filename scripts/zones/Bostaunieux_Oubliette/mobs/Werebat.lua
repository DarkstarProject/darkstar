-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Werebat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,611,2);
end;
