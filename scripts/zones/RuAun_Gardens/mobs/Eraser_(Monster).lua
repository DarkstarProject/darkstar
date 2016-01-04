-----------------------------------
-- Area: RuAun Gardens
--  MOB: Eraser (Monster)
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,143,2);
    checkRegime(ally,mob,144,1);
end;
