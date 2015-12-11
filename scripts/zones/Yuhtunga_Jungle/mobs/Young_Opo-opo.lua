-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Young Opo-opo
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,126,1);
    checkRegime(ally,mob,128,1);
end;
