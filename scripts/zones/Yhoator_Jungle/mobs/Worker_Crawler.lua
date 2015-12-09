-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Worker Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,132,1);
end;
