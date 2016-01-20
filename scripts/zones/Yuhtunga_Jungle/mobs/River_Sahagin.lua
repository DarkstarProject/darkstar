-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: River Sahagin
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,127,1);
end;
