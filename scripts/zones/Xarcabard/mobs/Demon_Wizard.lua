-----------------------------------
-- Area: Xarcabard
--  MOB: Demon Wizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,55,1);
end;
