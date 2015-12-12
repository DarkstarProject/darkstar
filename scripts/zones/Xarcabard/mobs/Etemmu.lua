-----------------------------------
-- Area: Xarcabard
--  MOB: Etemmu
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,51,2);
end;
