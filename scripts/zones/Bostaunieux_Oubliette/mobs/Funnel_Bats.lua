-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Funnel Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,611,1);
end;
