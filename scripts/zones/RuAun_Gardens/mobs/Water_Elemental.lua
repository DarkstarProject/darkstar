-----------------------------------
-- Area: RuAun Gardens
--  MOB: Water Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,146,3);
end;
