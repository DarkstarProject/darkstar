-----------------------------------
-- Area: Xarcabard
--  MOB: Demon Warlock
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,55,1);
end;
