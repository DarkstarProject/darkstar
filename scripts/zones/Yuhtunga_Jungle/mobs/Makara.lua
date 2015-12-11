-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Makara
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,127,2);
end;
