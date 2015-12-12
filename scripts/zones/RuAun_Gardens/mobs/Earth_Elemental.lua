-----------------------------------
-- Area: RuAun Gardens
--  MOB: Earth Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,146,2);
end;
