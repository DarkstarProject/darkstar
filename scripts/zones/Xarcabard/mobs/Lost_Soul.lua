-----------------------------------
-- Area: Xarcabard
--  MOB: Lost Soul
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,51,1);
    checkRegime(ally,mob,52,1);
    checkRegime(ally,mob,53,2);
    checkRegime(ally,mob,54,3);
end;
