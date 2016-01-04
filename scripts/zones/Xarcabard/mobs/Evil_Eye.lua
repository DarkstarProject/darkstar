-----------------------------------
-- Area: Xarcabard
--  MOB: Evil Eye
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,53,1);
    checkRegime(ally,mob,54,2);
    checkRegime(ally,mob,55,3);
end;
