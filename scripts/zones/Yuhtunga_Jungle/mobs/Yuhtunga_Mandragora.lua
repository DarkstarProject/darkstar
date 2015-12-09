-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Yuhtunga Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,124,1);
end;
