-----------------------------------
-- Area: RuAun Gardens
--  MOB: Flamingo
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,142,1);
end;
