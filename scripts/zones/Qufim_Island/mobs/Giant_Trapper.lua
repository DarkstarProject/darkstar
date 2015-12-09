-----------------------------------
-- Area: Qufim Island
--  MOB: Giant Trapper
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,44,1);
    checkRegime(ally,mob,45,2);
end;
