-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Goblin Robber
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,125,2);
end;
