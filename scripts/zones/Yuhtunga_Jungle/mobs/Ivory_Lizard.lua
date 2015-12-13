-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Ivory Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,124,2);
end;
