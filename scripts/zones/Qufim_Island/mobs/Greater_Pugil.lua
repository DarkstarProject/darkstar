-----------------------------------
-- Area: Qufim Island
--  MOB: Greater Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,43,1);
    checkRegime(ally,mob,44,2);
    checkRegime(ally,mob,45,3);
end;
