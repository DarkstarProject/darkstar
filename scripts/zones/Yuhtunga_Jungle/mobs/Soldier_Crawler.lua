-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Soldier Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,128,2);
end;
