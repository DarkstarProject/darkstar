-----------------------------------
-- Area: Xarcabard
--  MOB: Frost Gigas
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,54,1);
    checkRegime(ally,mob,55,2);
end;
