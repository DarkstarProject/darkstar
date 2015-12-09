-----------------------------------
-- Area: Qufim Island
--  MOB: Giant Ascetic
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,44,1);
    checkRegime(ally,mob,45,2);
end;
