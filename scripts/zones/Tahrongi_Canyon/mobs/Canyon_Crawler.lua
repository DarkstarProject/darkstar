-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Canyon Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,96,1);
end;
